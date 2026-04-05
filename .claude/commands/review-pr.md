---
description: Review a GitHub pull request for code quality, patterns, and best practices
model: claude-opus-4-6
argument-hint: "PR URL or number (e.g., 5 or https://github.com/mhenrixon/daisyui/pull/5)"
---

# PR Review

Review PR for pattern compliance and issues. Be concise.

## Workflow

1. Fetch PR details and diff via `mcp__github__pull_request_read`
2. Categorize files by type
3. Check for pattern violations
4. Output structured review

## Pattern Violations to Check

```ruby
# WRONG -> RIGHT
Missing component_class              -> Always set self.component_class
Missing responsive comments          -> Include sm:/md:/lg: comments for every modifier
Guessed DaisyUI class names          -> Verify with mcp__daisyui__daisyUI-Snippets
Hardcoded HTML tag                   -> Use as: parameter with public_send
Missing register_modifiers           -> Map all DaisyUI modifiers
component_class = nil (without reason) -> Set to DaisyUI class name
COLOR_MODIFIERS on wrong component   -> Only use on components that take bg-/text- colors
Missing sub-component methods        -> Add for component parts (body, title, etc.)
Tests without responsive coverage    -> Test at least one responsive modifier
```

## Output Format

```markdown
## Files Requiring Manual Review

| File | Reason |
|------|--------|
| lib/daisy_ui/new_component.rb | New component, verify DaisyUI 5 alignment |

## Critical Issues

- `lib/daisy_ui/button.rb:45` - Missing responsive comment for modifier

## Suggestions (non-blocking)

- Consider adding sub-component methods for parts

## Verdict

**Approve** / **Request Changes** - reason
```

## Tools

```text
mcp__github__pull_request_read
  method: "get"        -> PR details
  method: "get_diff"   -> Changes
  method: "get_files"  -> File list
  method: "get_status" -> CI status

mcp__daisyui__daisyUI-Snippets -> Verify DaisyUI class names
bundle exec rubocop    -> Style checks
bundle exec rspec      -> Tests
```
