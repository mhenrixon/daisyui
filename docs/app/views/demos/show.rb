# frozen_string_literal: true

module Views
  module Demos
    # One shared page for every reactive demo. Renders the demo's blurb and a
    # DemoPanel (live component + call-site + component source).
    class Show < Phlex::HTML
      include Phlex::Rails::Helpers::Routes

      def initialize(demo:)
        @demo = demo
      end

      def view_template
        render Views::Layout.new(title: @demo.title) do
          nav(class: "mb-6") do
            a(href: root_path, class: "link link-hover text-sm opacity-70") { "← Home" }
          end

          header(class: "mb-6") do
            h1(class: "text-3xl font-bold mb-2") { @demo.title }
            p(class: "opacity-70") { @demo.blurb }
          end

          render Views::Examples::DemoPanel.new(
            component: @demo.component,
            call_site: @demo.call_site
          )
        end
      end
    end
  end
end
