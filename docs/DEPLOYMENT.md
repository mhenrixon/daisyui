# Docs Deployment

The docs site is deployed automatically when a new gem version is released.

## Flow

```
rake release[X.Y.Z]
  └─> creates GitHub release
        └─> deploy-docs.yml workflow runs
              ├─> builds Docker image (repo root context)
              ├─> pushes to ghcr.io/mhenrixon/daisyui-docs:vX.Y.Z
              └─> Kamal deploys to the docs server via SSH
                    └─> kamal-proxy routes by Host header
                          └─> Cloudflare Tunnel surfaces it publicly
```

## Architecture

```
Internet
   │  HTTPS (TLS at edge)
   ▼
Cloudflare edge
   │  Tunnel
   ▼
[oss-docs server]
   ├─ cloudflared (systemd) ─► localhost:80
   │                              │
   ├─ kamal-proxy ◄───────────────┘
   │     │  Host: daisyui.zoolutions.llc
   │     ▼
   └─ daisyui-docs container
```

The server is provisioned by [`mhenrixon/oss-infrastructure`](https://github.com/mhenrixon/oss-infrastructure) (private). See that repo for the Terraform setup. The same server hosts docs for multiple gems (daisyui, pgbus, etc.) — each one is added by creating a Cloudflare Tunnel public hostname pointing at `localhost:80`.

## Prerequisites

A docs server must exist with:

- **Docker** installed (the deploy user must be in the `docker` group)
- **cloudflared** running as a systemd service, connected to a Cloudflare Tunnel
- **kamal-proxy** running on `:80` (started automatically by Kamal on first deploy)
- The **`oss` SSH user** (see `ssh: user:` in `deploy.yml`) configured with the
  public key matching `SSH_PRIVATE_KEY`
- A **Cloudflare Tunnel public hostname** for `${DEPLOY_DOMAIN}` routing to `http://localhost:80`

The provisioned server is `oss@<DEPLOY_HOST>` (e.g. `178.105.2.54`), domain
`daisyui.zoolutions.llc`.

### CSS at build time

The daisyUI/Tailwind stylesheet is compiled by **bun** (`bun run build:css`) into
`app/assets/builds/application.css`, which is gitignored. `rails assets:precompile`
is enhanced to run `css:build` first (see `docs/lib/tasks/build_css.rake`), and the
Dockerfile installs bun in the build stage, so the image is built with fully
compiled CSS — no separate step is required.

## GitHub Setup

The server IP (`178.105.2.54`) and domain (`daisyui.zoolutions.llc`) are set
directly in `docs/config/deploy.yml` — they are not secrets. Only two secrets are
needed in the `docs` environment:

| Secret | Description |
|--------|-------------|
| `SSH_PRIVATE_KEY` | Private key for the `oss` user on the docs server |
| `OP_SERVICE_ACCOUNT_TOKEN` | 1Password service account token (read access to the `oss-infrastructure` vault) |

Set them with:

```bash
gh secret set SSH_PRIVATE_KEY --env docs --repo mhenrixon/daisyui < ~/.ssh/<deploy-key>
gh secret set OP_SERVICE_ACCOUNT_TOKEN --env docs --repo mhenrixon/daisyui --body "<token>"
```

The `GITHUB_TOKEN` is automatically available and used for ghcr.io authentication.

To change the server or domain later, edit `servers:` / `proxy.host` in
`docs/config/deploy.yml` directly.

`RAILS_MASTER_KEY` is **not** a GitHub secret — it's fetched from 1Password at deploy time via Kamal's adapter (see `docs/.kamal/secrets`).

## 1Password setup

The gem's secrets live in 1Password under:

```
op://oss-infrastructure/daisyui-docs/
  └─ rails_master_key  (concealed)
```

To add or rotate:

```bash
op item edit daisyui-docs --vault oss-infrastructure rails_master_key='<new-value>'
```

## Container Layout

The Dockerfile uses the **repo root** as build context (not `docs/`) so the path gem dependency `gem "daisyui", path: ".."` resolves correctly.

Inside the container:
- `/gem/` — gem source (lib/, exe/, gemspec)
- `/gem/docs/` — Rails docs app (working directory)
- `/data/` — persistent SQLite database (volume mount)

## Manual Operations

```bash
# Trigger a deploy manually (without releasing a new version)
gh workflow run deploy-docs.yml --repo mhenrixon/daisyui

# Tail logs on the server
ssh oss@$DEPLOY_HOST "docker logs daisyui-docs-web -f"

# Tail kamal-proxy logs
ssh oss@$DEPLOY_HOST "docker logs kamal-proxy -f"

# Tail cloudflared logs
ssh oss@$DEPLOY_HOST "sudo journalctl -u cloudflared -f"

# SSH into the running container
ssh oss@$DEPLOY_HOST "docker exec -it daisyui-docs-web bash"

# Roll back to a previous version
cd docs && bundle exec kamal deploy --version=v1.0.6
```

## Troubleshooting

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| Workflow fails at "Login to GHCR" | Token missing `packages: write` | Already set in workflow `permissions:` |
| Workflow fails fetching from 1Password | Missing or expired `OP_SERVICE_ACCOUNT_TOKEN` | Rotate in 1Password and update GitHub secret |
| Kamal "host unreachable" | `DEPLOY_HOST` wrong or SSH key not authorized | Verify secret + `~/.ssh/authorized_keys` on server |
| 502 from Cloudflare after deploy | App container crashed or kamal-proxy not running | `docker logs daisyui-docs-web`, `docker logs kamal-proxy` |
| 404 from kamal-proxy | `proxy.host` doesn't match `DEPLOY_DOMAIN` | Check the `host:` value in `docs/config/deploy.yml` matches the GitHub secret |
| Tunnel showing as DOWN in CF dashboard | cloudflared not running on server | `sudo systemctl status cloudflared` on the server |
| Asset 404s after deploy | Asset bridging didn't run | Verify `asset_path` in `deploy.yml` is `/gem/docs/public/assets` |
| SQLite data lost | Volume not mounted correctly | Verify `daisyui_docs_data:/data` in `deploy.yml` volumes |
