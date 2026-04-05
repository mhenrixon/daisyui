# Testing Rules

## TDD Workflow

Follow RED -> GREEN -> REFACTOR:

1. **RED**: Write a failing test first
2. **GREEN**: Write minimal code to pass
3. **REFACTOR**: Improve code while keeping tests green

## Coverage Requirements

- **80% minimum** for all code
- **100% required** for:
  - Component modifier mappings
  - Base class (classes, attributes, responsive)
  - Configuration

## Test Types

| Feature involves | Use |
|-----------------|-----|
| Gem component | Unit spec in `spec/lib/daisy_ui/` |
| Base class behavior | Unit spec in `spec/lib/daisy_ui/base_spec.rb` |
| Docs examples | System spec in `docs/spec/system/` |

## RSpec Conventions

```ruby
# Use subject for the rendered output
subject(:output) { render described_class.new }

# Use contexts for modifier scenarios
context "when given :primary modifier" do
  subject(:output) { render described_class.new(:primary) }

  it "renders it apart from the main class" do
    expected_html = html <<~HTML
      <button class="btn btn-primary"></button>
    HTML
    expect(output).to eq(expected_html)
  end
end

# Test responsive modifiers
context "when given responsive options" do
  subject(:output) do
    render described_class.new(:primary, responsive: { sm: :lg })
  end

  it "renders with responsive prefix" do
    expected_html = html <<~HTML
      <button class="btn btn-primary sm:btn-lg"></button>
    HTML
    expect(output).to eq(expected_html)
  end
end
```

## What Every Component Spec Should Cover

1. Default rendering (base class only)
2. Each modifier individually
3. Multiple modifiers combined
4. Responsive modifiers (at least one viewport)
5. Custom classes via `class:` option
6. Data attributes via `data:` option
7. Custom tag via `as:` option (if supported)
8. Sub-component methods (if any)

## Test Checklist

- [ ] Tests written BEFORE implementation
- [ ] All tests pass: `bundle exec rspec`
- [ ] Coverage meets requirements
- [ ] Each modifier tested individually
- [ ] Responsive modifiers tested
- [ ] Sub-components tested
- [ ] Edge cases covered
