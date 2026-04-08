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
```

## Prerequisites

A docs server must exist with:

- **Docker** installed
- A **Traefik** container running on a Docker network named `traefik`
- The **deploy SSH user** configured with the public key matching `SSH_PRIVATE_KEY` GitHub secret
- **Open ports**: 22 (SSH), 80 (HTTP), 443 (HTTPS)
- **DNS**: an A record pointing to the server for the `DEPLOY_DOMAIN`

The server provisioning is handled by the [`mhenrixon/oss-infrastructure`](https://github.com/mhenrixon/oss-infrastructure) repo (private). See that repo for the Terraform setup.

## GitHub Setup

In the daisyui repo settings, create an environment named `docs` with these secrets:

| Secret | Description |
|--------|-------------|
| `SSH_PRIVATE_KEY` | Private key for the deploy user on the docs server |
| `DEPLOY_HOST` | Server IP or hostname |
| `DEPLOY_DOMAIN` | Public domain (e.g., `daisyui.example.com`) |
| `RAILS_MASTER_KEY` | Contents of `docs/config/master.key` |

The `GITHUB_TOKEN` is automatically available and used for ghcr.io authentication.

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
ssh deploy@$DEPLOY_HOST "docker logs daisyui-docs-web -f"

# SSH into the running container
ssh deploy@$DEPLOY_HOST "docker exec -it daisyui-docs-web bash"

# Roll back to a previous version
cd docs && bundle exec kamal deploy --version=v1.0.6
```

## Troubleshooting

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| Workflow fails at "Login to GHCR" | Token missing `packages: write` | Already set in workflow `permissions:` |
| Kamal "host unreachable" | `DEPLOY_HOST` wrong or SSH key not authorized | Verify secret + `~/.ssh/authorized_keys` on server |
| 502 from Traefik after deploy | App container crashed; check `docker logs` | Usually missing `RAILS_MASTER_KEY` or DB permission issue |
| Asset 404s after deploy | Asset bridging didn't run | Verify `asset_path` in `deploy.yml` matches container layout (`/gem/docs/public/assets`) |
| SQLite data lost | Volume not mounted correctly | Verify `daisyui_docs_data:/data` in `deploy.yml` volumes |
