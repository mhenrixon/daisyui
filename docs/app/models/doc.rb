# frozen_string_literal: true

# Registry of the reference docs (guides). Each entry maps a URL slug to its
# title, sidebar group, and the Phlex page class that renders it (hand-authored —
# the docs are self-contained Phlex). DocsController renders `view_class`; only
# docs whose page class exists are linked in the sidebar, so there are never dead
# links while the remaining pages are being authored.
class Doc
  REGISTRY = [
    { slug: "installation", title: "Installation", group: "Guide", view: "Installation" },
    { slug: "getting-started", title: "Getting started", group: "Guide", view: "GettingStarted" },
    { slug: "theming", title: "Theming", group: "Guide", view: "Theming" },
  ].freeze

  attr_reader :slug, :title, :group, :view_name

  def initialize(slug:, title:, group:, view:)
    @slug = slug
    @title = title
    @group = group
    @view_name = view
  end

  def self.all
    REGISTRY.map { new(**it) }
  end

  def self.from_slug(slug)
    all.find { it.slug == slug }
  end

  def self.grouped
    all.group_by(&:group)
  end

  # The hand-authored Phlex page class for this doc (nil if not yet written).
  def view_class
    "Views::Docs::Pages::#{view_name}".safe_constantize
  end
end
