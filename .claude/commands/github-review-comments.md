---
description: "Use when a PR has unresolved review comments that need responses -- evaluates each comment, implements valid fixes, pushes back on incorrect suggestions, and resolves all threads."
model: opus
argument-hint: "PR number (e.g., 123 or #123)"
allowed-tools: Bash(gh pr view:*), Bash(gh pr diff:*), Bash(gh pr comment:*), Bash(gh api:*), Bash(git log:*), Bash(git blame:*), Bash(git push:*), Bash(git commit:*), Bash(git add:*), Bash(bundle exec:*), Read, Write, Edit, Glob, Grep, Agent
---

# Review GitHub PR Comments: $ARGUMENTS

You are reviewing and responding to all unresolved review comments on a GitHub pull request.

## Phase 0: Determine the PR Number

Parse `$ARGUMENTS` flexibly: `PR123`, `123`, `#123` -> PR 123. If empty, auto-detect from current branch:

```bash
gh pr list --author=@me --head="$(git branch --show-current)" --state=open --json number,title
```

## Phase 1: Fetch All Unresolved Review Comments

```bash
gh api graphql -f query='
  query($owner: String!, $repo: String!, $pr: Int!) {
    repository(owner: $owner, name: $repo) {
      pullRequest(number: $pr) {
        reviewThreads(first: 100) {
          nodes {
            id
            isResolved
            path
            line
            comments(first: 20) {
              nodes {
                id
                databaseId
                body
                author { login }
                createdAt
              }
            }
          }
        }
      }
    }
  }
' -f owner=mhenrixon -f repo=daisyui -F pr=<PR_NUMBER>
```

Filter to only **unresolved** threads. Skip bot comments and resolved threads.

## Phase 2: Categorise Each Comment

| Category | Action |
|----------|--------|
| Valid fix needed | Implement the fix |
| Valid test gap | Add the missing test |
| Incorrect suggestion | Push back with technical reasoning |
| Suggestion conflicts with DaisyUI 5 spec | Push back, reference MCP snippet |
| Unclear | Ask for clarification |

**Before categorising**, always read the actual file and verify against DaisyUI 5 specs.

## Phase 3: Implement Accepted Fixes

1. Make changes
2. Run `bundle exec rspec <relevant_specs>`
3. Run `bundle exec rubocop <changed_files>`
4. Commit and push

## Phase 4: Reply to Every Comment

For accepted fixes, reply with commit SHA. For rejected suggestions, reply with technical reasoning. Resolve all threads via GraphQL.

## Phase 5: Verify Completion

Confirm no unresolved threads remain. Report final tally.
