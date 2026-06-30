# frozen_string_literal: true

module Views
  module Landings
    class Show < Phlex::HTML
      include Phlex::Rails::Helpers::Routes

      def initialize(demos:)
        @demos = demos
      end

      def view_template
        render Views::Layout.new do
          header(class: "mb-10") do
            h1(class: "text-4xl font-bold mb-3") { "DaisyUI Ruby" }
            p(class: "text-lg opacity-80 max-w-2xl") do
              plain "Ruby UI components for "
              a(href: "https://daisyui.com", class: "link") { "daisyUI" }
              plain ", built with "
              a(href: "https://www.phlex.fun", class: "link") { "Phlex" }
              plain ". Compose modern, accessible interfaces in plain Ruby — and "
              plain "make them reactive with zero custom JavaScript. Every demo "
              plain "below runs live."
            end
          end

          live_demos_section
          components_section
          docs_section
        end
      end

      private

      def live_demos_section
        section(class: "mb-12") do
          h2(class: "text-sm uppercase tracking-wide opacity-60 mb-4") { "Live demos" }
          div(class: "grid gap-4 sm:grid-cols-2") do
            @demos.each { demo_card(it) }
          end
        end
      end

      def components_section
        components = ComponentDoc.all.select(&:example_class)
        return if components.empty?

        section(class: "mb-12") do
          h2(class: "text-sm uppercase tracking-wide opacity-60 mb-4") { "Components" }
          div(class: "grid gap-2 sm:grid-cols-2") do
            components.each { component_link(it) }
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

      def demo_card(demo)
        a(href: demo_path(demo.slug),
          class: "card bg-base-200 hover:bg-base-300 transition-colors p-5 block",
          data: { testid: "demo-card-#{demo.slug}" }) do
            h3(class: "text-xl font-semibold mb-1") { demo.title }
            p(class: "opacity-70 text-sm") { demo.blurb }
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
