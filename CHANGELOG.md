## [Unreleased]

### Added

- Aura component (DaisyUI 5.6) with style variants (dual, rainbow, holo, gold, silver, glow) and sizes
- Megamenu component (DaisyUI 5.6) with wide, full, vertical modifiers, sizes, and active_indicator sub-component
- OTP component (DaisyUI 5.6) for one-time password inputs with configurable digit count, joined modifier, sizes, and color variants
- `Dropdown` `:popover` modifier — renders the menu via the native Popover API
  and CSS anchor positioning, so it opens in the top layer and escapes
  `overflow` clipping (e.g. inside a table's `overflow-x-auto`). Accepts a
  `popover_id:` for a stable id. Default and `:tap_to_close` dropdowns are
  unchanged. See the README "Dropdown `:popover` positioning" note for the
  optional older-browser polyfill.

### Changed

- Range component: added range-vertical modifier for vertical orientation (DaisyUI 5.6)
- Tooltip component: added alignment modifiers (tooltip-start, tooltip-center, tooltip-end) and tooltip-content sub-component (DaisyUI 5.6)

## [0.1.0] - 2024-08-02

- Initial release
