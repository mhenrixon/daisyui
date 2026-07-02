---
description: "Audit all gem components against DaisyUI 5 documentation for inconsistencies. Use when checking alignment after a DaisyUI version bump."
model: sonnet
---

# Audit All Components

Check all gem components against DaisyUI 5 documentation for inconsistencies.

## Instructions

1. List all component files:
   ```bash
   ls lib/daisy_ui/*.rb | grep -v base.rb | grep -v version.rb
   ```

2. For each component:
   - Get the DaisyUI snippet using `mcp__daisyui__daisyUI-Snippets`
   - Read the gem component file
   - Check for:
     - Missing modifiers
     - Incorrect class names
     - Missing responsive comments
     - Deprecated modifiers

3. Create a report table:
   ```
   | Component | Status | Issues |
   |-----------|--------|--------|
   | button    | OK     | -      |
   | card      | WARN   | Missing 'glass' modifier |
   ```

4. For components with issues:
   - List specific problems
   - Suggest fixes

5. Offer to fix issues one component at a time.
