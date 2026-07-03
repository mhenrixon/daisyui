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
    # The one-line summary agents read first in /llms.txt (the llmstxt.org
    # blockquote under the H1).
    c.tagline       = "daisyUI's components as first-class Phlex — 70+ Ruby " \
                      "components you compose in views, no HTML class soup."
    c.themes        = %w[
      dark light cupcake synthwave retro cyberpunk valentine
      dracula night coffee nord sunset business emerald corporate
    ]

    # A light base with a dark override, so code stays readable when the switcher
    # lands on a dark theme. CSS-only scoping ([data-theme=X]) — no JS, no flash.
    c.code_theme      = "Rouge::Themes::Github"
    c.code_theme_dark = "Rouge::Themes::Monokai"
    c.version_badge   = -> { "v#{DaisyUI::VERSION}" }

    # The sidebar interleaves Components + Guides, so it stays a bespoke lambda.
    c.nav = -> { DocsNav.groups }

    # nav_registries feeds the AI surfaces (/llms.txt, /llms-full.txt, search)
    # from the registries — the custom c.nav above only drives the sidebar, so
    # without this the AI index would be empty. Both registries expose the
    # Registry v2 shape (#nav_items + #href + #view_class).
    c.nav_registries = { "Components" => ComponentDoc, "Guides" => Doc }
  end
end
