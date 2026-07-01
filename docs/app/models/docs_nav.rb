# frozen_string_literal: true

# Builds the docs-kit sidebar nav from this site's registries (Doc guides +
# ComponentDoc component reference), mapping each entry to a DocsKit::NavItem.
# Kept out of the initializer so the nav rebuilds with the registries under code
# reload and stays testable.
module DocsNav
  # A lucide icon per doc group (component entries render without an icon).
  DOC_GROUP_ICONS = {
    "Guide" => "book-open",
  }.freeze

  module_function

  def groups
    nav = {}
    nav["Docs"] = doc_group if doc_group.any?
    nav["Components"] = component_group if component_group.any?
    nav
  end

  # Only guides whose Phlex page exists are linkable (no dead links).
  def doc_group
    Doc.all.select(&:view_class).group_by(&:group).transform_values do |items|
      items.map do |doc|
        DocsKit::NavItem.new(
          href: "/docs/#{doc.slug}",
          label: doc.title,
          icon: DOC_GROUP_ICONS[doc.group] || "file-text"
        )
      end
    end
  end

  # Only components with at least one authored example are linkable.
  # Uses ComponentDoc.grouped to preserve official DaisyUI category ordering.
  def component_group
    ComponentDoc.grouped.transform_values do |items|
      linkable = items.select(&:example_class)
      next nil if linkable.empty?

      linkable.map { |c| DocsKit::NavItem.new(href: "/components/#{c.slug}", label: c.title) }
    end.compact
  end
end
