---
description: "Run the complete test suite for both the gem and docs site. Use after broad changes to verify nothing is broken."
model: sonnet
---

# Run All Tests

Run the complete test suite for both the gem and docs site.

## Instructions

1. Run gem tests from the repository root:
   ```bash
   bundle exec rspec
   ```

2. Run gem linting:
   ```bash
   bundle exec rubocop
   ```

3. Run docs tests (from docs/ directory):
   ```bash
   cd docs && bundle exec rspec
   ```

4. Run docs linting:
   ```bash
   cd docs && bundle exec standardrb
   ```

5. Report summary:
   - Gem tests: X passed, Y failed
   - Gem lint: X offenses
   - Docs tests: X passed, Y failed
   - Docs lint: X offenses

6. If any failures, provide details and offer to fix them.
