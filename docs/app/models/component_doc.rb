# frozen_string_literal: true

# Registry of the component reference pages — one entry per documented daisyUI
# gem component. Each maps a URL slug to its title and sidebar category, plus the
# Phlex example class that demonstrates it (Views::Components::Examples::<Example>).
# Only components whose example class exists are linked in the sidebar, so there
# are never dead links while the rest of the reference is being authored.
#
# This is the curated replacement for the old YAML-driven Component registry: add
# a row here and an example class under app/views/components/examples/ to publish
# a component page.
class ComponentDoc
  REGISTRY = [
    { slug: "button", title: "Button", category: "Actions", example: "Button" },
  ].freeze

  attr_reader :slug, :title, :category, :example_name

  def initialize(slug:, title:, category:, example:)
    @slug = slug
    @title = title
    @category = category
    @example_name = example
  end

  def self.all
    REGISTRY.map { new(**it) }
  end

  def self.from_slug(slug)
    all.find { it.slug == slug }
  end

  def self.grouped
    all.group_by(&:category)
  end

  # The hand-authored Phlex example class for this component (nil if not yet
  # written).
  def example_class
    "Views::Components::Examples::#{example_name}".safe_constantize
  end
end
