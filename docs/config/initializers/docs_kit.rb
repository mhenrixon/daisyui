# frozen_string_literal: true

# Per-site configuration for the shared docs chrome (docs-kit). Everything that
# makes this site look like "DaisyUI Ruby" rather than any other docs site lives
# here; the Shell/Sidebar/ThemeSwitcher themselves are shared with the
# phlex-reactive docs site via the gem.
#
# The themes are a curated subset (the CSS enables `themes: all`, so any work).
# The first entry matches the shell's default data-theme.
Rails.application.config.to_prepare do
  DocsKit.configure do |c|
    c.brand         = "DaisyUI Ruby"
    c.title_suffix  = "DaisyUI Ruby"
    c.themes        = %w[
      dark light cupcake synthwave retro cyberpunk valentine
      dracula night coffee nord sunset business emerald corporate
    ]
    # Monokai, inlined by Docs::Code — same as the phlex-reactive docs site.
    c.code_theme    = "Rouge::Themes::Monokai"
    c.version_badge = -> { "v#{DaisyUI::VERSION}" }
    c.nav           = -> { DocsNav.groups }
  end
end
