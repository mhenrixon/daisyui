# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Documentation website for DaisyUI, a Ruby UI component library using Phlex. Built with Rails 8.1+, Phlex-Rails, Tailwind CSS 4.1, and DaisyUI 5.6.

## Common Commands

```bash
bin/setup              # Install dependencies and setup database
bin/dev                # Start development server
bin/ci                 # Run full CI pipeline locally

# Testing
bin/rails test         # Unit tests
bin/rails test:system  # System/browser tests
bundle exec rspec      # RSpec tests

# Code Quality
bin/rubocop            # Ruby linting
bin/rubocop -A         # Auto-fix Ruby issues
bin/brakeman --quiet --no-pager  # Security scan
bun run lint:js        # JavaScript linting (Biome)
bun run lint:css       # CSS linting (Stylelint)

# CSS
bun run build:css      # Build Tailwind CSS
bun run watch:css      # Watch CSS changes
```

## Architecture

### View System (Phlex-Rails)
All views are Ruby classes, not ERB templates. Views inherit from `ApplicationView` or `ApplicationComponent`.

```
app/views/
├── application_view.rb              # Base view class
├── examples/                        # Component example pages
│   └── buttons/show_view.rb         # ShowView renders all examples
├── components/examples/             # Individual example components
│   └── buttons/basic_component.rb   # Each example is a component class
└── layouts/                         # Layout components
```

### Component Registry
- `config/components.yml` defines all DaisyUI components by category
- Components loaded at startup via `config/initializers/load_components.rb`

### Frontend Stack
- Tailwind CSS 4.1 + DaisyUI 5.6 (entry: `app/assets/stylesheets/application.tailwind.css`)
- Hotwired Turbo + Stimulus for interactivity
- Importmap for JavaScript (no bundler)
- Package manager: Bun 1.3.2

## Generators

```bash
# Add new component (creates ShowView + BasicComponent)
bin/rails generate example_view Menu Navigation

# Add example to existing component
bin/rails generate example_component Menus::Responsive "Optional title"
```

## Known Issues

When modifying a component example's `example` method, you may encounter `MethodSource::SourceNotFoundError`. Restart the server to fix.
