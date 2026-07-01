# frozen_string_literal: true

module Views
  module Landings
    class Show < Phlex::HTML
      include Phlex::Rails::Helpers::Routes

      def view_template
        DocsUI::Shell() do
          header(class: "mb-10") do
            h1(class: "text-4xl font-bold mb-3") { "DaisyUI Ruby" }
            p(class: "text-lg opacity-80 max-w-2xl") do
              plain "Ruby UI components for "
              a(href: "https://daisyui.com", class: "link") { "daisyUI" }
              plain ", built with "
              a(href: "https://www.phlex.fun", class: "link") { "Phlex" }
              plain ". Compose modern, accessible interfaces in plain Ruby — "
              plain "every component below has a live preview and its source."
            end
          end

          components_section
          docs_section
        end
      end

      private

      def components_section
        grouped = ComponentDoc.all.select(&:example_class).group_by(&:category)
        return if grouped.empty?

        section(class: "mb-12") do
          h2(class: "text-sm uppercase tracking-wide opacity-60 mb-4") { "Components" }
          grouped.each do |category, components|
            h3(class: "text-xs font-semibold uppercase tracking-wider opacity-50 mt-6 mb-2") { category }
            div(class: "grid gap-2 sm:grid-cols-2 md:grid-cols-3") do
              components.each { component_link(it) }
            end
          end
        end
      end

      def docs_section
        docs = Doc.all.select(&:view_class)
        return if docs.empty?

        section do
          h2(class: "text-sm uppercase tracking-wide opacity-60 mb-4") { "Documentation" }
          div(class: "grid gap-2 sm:grid-cols-2") do
            docs.each { doc_link(it) }
          end
        end
      end

      def component_link(component)
        a(href: component_path(component.slug),
          class: "link link-hover text-sm py-1",
          data: { testid: "component-link-#{component.slug}" }) { component.title }
      end

      def doc_link(doc)
        a(href: doc_path(doc.slug),
          class: "link link-hover text-sm py-1",
          data: { testid: "doc-link-#{doc.slug}" }) { doc.title }
      end
    end
  end
end
