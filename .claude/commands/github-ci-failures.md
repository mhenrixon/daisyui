---
description: "Use when CI checks are failing on a PR — fetches failure logs, diagnoses root causes, implements fixes, and pushes until CI is green."
model: opus
argument-hint: "PR number (e.g., 41 or #41)"
allowed-tools: Bash(gh pr view:*), Bash(gh pr checks:*), Bash(gh pr diff:*), Bash(gh api:*), Bash(gh run view:*), Bash(git log:*), Bash(git diff:*), Bash(git push:*), Bash(git commit:*), Bash(git add:*), Bash(bundle exec:*), Read, Write, Edit, Glob, Grep, Agent
---

# Fix GitHub CI Failures: $ARGUMENTS

Work systematically: identify failures, read logs, diagnose root causes, fix locally, verify, push.

## Phase 0: Determine the PR Number

Parse `$ARGUMENTS` flexibly. If empty, auto-detect from current branch:

```bash
gh pr list --author=@me --head="$(git branch --show-current)" --state=open --json number,title
```

## Phase 1: Identify Failing Checks

```bash
gh pr checks <PR_NUMBER>
```

## Phase 2: Fetch Failure Logs

```bash
gh run view <RUN_ID> --job=<JOB_ID> --log-failed
```

## Phase 3: Diagnose Each Failure

### Lint Failures
- RuboCop offenses: file path, line number, cop name

### Spec Failures
- Test name and file path
- Error class and message
- Whether test environment issue vs actual code bug

### Docs Test Failures
- Playwright timeouts, missing elements, CSS class mismatches
- May need CSS rebuild: `cd docs && bun run build:css`

## Phase 4: Fix Locally

1. Read the relevant file before fixing
2. Make the fix
3. Verify locally:
```bash
bundle exec rubocop <changed_files>
bundle exec rspec <failing_spec_files>
```

## Phase 5: Commit and Push

```bash
git add <specific_files>
git commit -m "$(cat <<'EOF'
fix(ci): <brief description>

- Fix 1
- Fix 2
EOF
)"
git push
```

## Phase 6: Verify

```bash
gh pr checks <PR_NUMBER>
```

Report status. Do NOT poll in a loop.
