---
description: "Compare a gem component against official DaisyUI 5 docs. Use when verifying a single component's alignment."
model: sonnet
argument-hint: "component name (e.g., button, card, modal)"
---

# Check Component Against DaisyUI 5

Compare a gem component against the official DaisyUI 5 documentation.

## Arguments
- `$ARGUMENTS` - Component name (e.g., "button", "card", "modal")

## Instructions

1. First, get the official DaisyUI snippet for this component using the `mcp__daisyui__daisyUI-Snippets` tool with `{"components": {"$ARGUMENTS": true}}`

2. Read the gem component file at `lib/daisy_ui/$ARGUMENTS.rb`

3. Compare:
   - All DaisyUI 5 modifiers are supported
   - Class names match exactly (e.g., `btn-primary` not `button-primary`)
   - Size modifiers use correct names (xs, sm, md, lg, xl)
   - Responsive comments are present for all modifiers

4. Read the component spec at `spec/lib/daisy_ui/$ARGUMENTS_spec.rb`

5. Report:
   - Missing modifiers from DaisyUI 5
   - Incorrect class names
   - Missing responsive comments
   - Missing test coverage

6. If issues found, offer to fix them with proper tests.
