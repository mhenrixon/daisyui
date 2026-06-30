# frozen_string_literal: true

module Views
  # The drawer sidebar: brand + grouped reference docs, component reference, and
  # live reactive demos, driven by the Doc / ComponentDoc / Demo registries.
  # Renders inside the daisyUI drawer-side (the Layout owns responsive visibility),
  # so this is just the panel content.
  class Sidebar < Phlex::HTML
    include Phlex::Rails::Helpers::Routes
    include Phlex::Rails::Helpers::Request
    include DaisyUI

    # A lucide icon per demo slug; groups fall back to a default.
    DEMO_ICONS = {
      "counter" => "calculator",
      "searchable-combobox" => "search",
    }.freeze
    GROUP_ICON = {
      "Guide" => "book-open",
    }.freeze

    def view_template
      div(class: "bg-base-200 flex min-h-full w-72 flex-col") do
        header_section
        div(class: "flex-1 overflow-y-auto px-2 pb-6") do
          Menu(class: "w-full gap-1") do
            nav_group("Docs", authored_docs) { |doc| nav_link(doc_path(doc.slug), doc.title, doc_icon(doc)) }
            nav_group("Components", authored_components) { |c| nav_link(component_path(c.slug), c.title, nil) }
            nav_group("Demos", Demo.grouped) { |demo| nav_link(demo_path(demo.slug), demo.title, DEMO_ICONS[demo.slug]) }
          end
        end
      end
    end

    private

    def header_section
      div(class: "flex min-h-16 items-center gap-2 px-4") do
        a(href: root_path, class: "text-lg font-bold text-base-content") { "DaisyUI Ruby" }
        span(class: "badge badge-sm badge-ghost") { "v#{DaisyUI::VERSION}" }
      end
    end

    # A top-level collapsible group with its sub-groups (e.g. "Components" →
    # "Actions"). `grouped` is a { subgroup => items } hash.
    def nav_group(heading, grouped, &)
      return if grouped.empty?

      li do
        details(open: true) do
          summary(class: "text-xs font-semibold uppercase tracking-wider text-base-content/50") { heading }
          ul do
            grouped.each do |subgroup, items|
              li(class: "menu-title text-xs") { subgroup }
              items.each { |item| li { yield(item) } }
            end
          end
        end
      end
    end

    def nav_link(href, label, icon_name)
      a(href:, class: link_classes(href)) do
        render Views::Icon.new(icon_name, class: "size-4 shrink-0") if icon_name
        span(class: "truncate") { label }
      end
    end

    def link_classes(href)
      active = current_path == href
      ["flex items-center gap-3", (active ? "menu-active font-medium" : nil)].compact
    end

    def doc_icon(doc)
      GROUP_ICON[doc.group] || "file-text"
    end

    # Only entries whose Phlex class exists are linkable (no dead links while the
    # remaining pages are being authored).
    def authored_docs
      Doc.all.select(&:view_class).group_by(&:group)
    end

    def authored_components
      ComponentDoc.all.select(&:example_class).group_by(&:category)
    end

    def current_path
      request&.path
    rescue StandardError
      nil
    end
  end
end
