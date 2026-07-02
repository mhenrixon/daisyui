---
description: "Run docs tests and fix any failures. Use when docs specs are red after component or example changes."
model: sonnet
---

# Fix Docs Tests

Run docs tests and fix any failures.

## Instructions

1. Build CSS first:
   ```bash
   cd docs && bun run build:css
   ```

2. Run the docs test suite:
   ```bash
   cd docs && bundle exec rspec spec/system/components_spec.rb
   ```

3. For each failure:
   - Identify the component being tested
   - Check if the component exists in the gem
   - Check if the example view exists in docs
   - Verify the CSS class being tested matches DaisyUI 5

4. Common fixes:
   - **Missing CSS class**: Component may need updating in gem
   - **Route not found**: Example view may be missing
   - **Element not found**: Check selector matches actual HTML
   - **Timeout**: May need `wait_for_turbo` or longer wait

5. For each fix:
   - Update the necessary file
   - Re-run the specific test to verify
   - Continue to next failure

6. Final verification:
   ```bash
   cd docs && bundle exec rspec spec/system/components_spec.rb
   ```

7. Report summary of fixes made.
