# frozen_string_literal: true

module Views
  module Components
    # One shared page for every component-reference entry. Instantiates the
    # component's example class and renders it through a Preview/Source DemoPanel.
    class Show < Phlex::HTML
      include Phlex::Rails::Helpers::Routes

      def initialize(component:)
        @component = component
        @example = component.example_class.new
      end

      def view_template
        render Views::Layout.new(title: @component.title) do
          nav(class: "mb-6") do
            a(href: root_path, class: "link link-hover text-sm opacity-70") { "← Home" }
          end

          header(class: "mb-6") do
            div(class: "mb-2 text-xs font-semibold uppercase tracking-wider text-primary") { @component.category }
            h1(class: "text-3xl font-bold") { @component.title }
          end

          render Views::Components::DemoPanel.new(example: @example)
        end
      end
    end
  end
end
