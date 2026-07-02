---
description: "Use when implementing any feature or fixing any bug -- enforces RED-GREEN-REFACTOR: write failing test first, implement minimum code to pass, then refactor."
model: sonnet
---

# TDD Command

Enforce test-driven development methodology with RED -> GREEN -> REFACTOR cycle.

## The TDD Cycle

```text
RED -> GREEN -> REFACTOR -> REPEAT

RED:      Write a failing test (test MUST fail first)
GREEN:    Write MINIMAL code to pass (nothing more)
REFACTOR: Improve code while keeping tests green
REPEAT:   Next feature/scenario
```

## When to Use

- Implementing new components
- Adding new modifiers to existing components
- Fixing bugs (write test that reproduces bug FIRST)
- Refactoring existing components
- Adding sub-component methods

## Workflow

### Step 1: Write Failing Tests (RED)

```ruby
# spec/lib/daisy_ui/new_component_spec.rb
describe DaisyUI::NewComponent do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="new-component"></div>
    HTML
    expect(output).to eq(expected_html)
  end

  describe "modifiers" do
    context "when given :primary modifier" do
      subject(:output) { render described_class.new(:primary) }

      it "renders it apart from the main class" do
        expected_html = html <<~HTML
          <div class="new-component new-component-primary"></div>
        HTML
        expect(output).to eq(expected_html)
      end
    end
  end
end
```

### Step 2: Run Tests - Verify FAIL

```bash
bundle exec rspec spec/lib/daisy_ui/new_component_spec.rb

FAIL - NameError / Expected behavior not met
```

**Tests MUST fail before implementing.** This confirms:
- Tests are actually running
- Tests are testing the right thing
- Implementation doesn't already exist

### Step 3: Implement Minimal Code (GREEN)

Write the minimum code to make the test pass.

### Step 4: Run Tests - Verify PASS

```bash
bundle exec rspec spec/lib/daisy_ui/new_component_spec.rb

N examples, 0 failures
```

### Step 5: Refactor (IMPROVE)

Improve code while keeping tests green:
- Extract methods
- Improve naming
- Reduce duplication

### Step 6: Run Full Suite

```bash
bundle exec rspec
```

## What Every Component Spec Should Cover

1. Default rendering (base class only)
2. Each modifier individually
3. Multiple modifiers combined
4. Responsive modifiers (at least one viewport)
5. Custom classes via `class:` option
6. Data attributes via `data:` option
7. Custom tag via `as:` option
8. Sub-component methods (if any)

## Coverage Requirements

| Code Type | Minimum Coverage |
|-----------|------------------|
| All code | 80% |
| Component modifiers | 100% |
| Base class | 100% |
| Configuration | 100% |

## Checklist

- [ ] Tests written BEFORE implementation
- [ ] Tests fail initially (RED phase verified)
- [ ] Minimal code written to pass (GREEN)
- [ ] Code refactored with tests still passing
- [ ] Coverage meets requirements (80%+)
- [ ] All modifiers tested
- [ ] Responsive modifiers tested
- [ ] DaisyUI class names verified via MCP server
