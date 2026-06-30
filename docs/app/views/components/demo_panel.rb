# frozen_string_literal: true

module Views
  module Components
    # The code-alongside panel for one component example, shown in CSS-only daisyUI
    # tabs (no JS):
    #   • Preview — the live daisyUI component, on a subtle checkered backdrop
    #   • Source  — the Ruby that produced it (extracted from the example method)
    #
    # The same `example` instance is rendered live AND its #example source is read,
    # so code and preview never drift.
    class DemoPanel < Phlex::HTML
      # A faint checkerboard so transparent/edge-of-component spacing is visible,
      # matching the daisyUI docs preview surface.
      PREVIEW_STYLE = <<~CSS
        background-image: repeating-linear-gradient(
          45deg,
          var(--color-base-200) 0,
          var(--color-base-200) 13px,
          var(--color-base-100) 13px,
          var(--color-base-100) 14px
        );
      CSS

      def initialize(example:)
        @example = example
      end

      def view_template
        div(class: "tabs tabs-lifted", role: "tablist", data: { testid: "component-panel" }) do
          tab(name: "Preview", checked: true, testid: "tab-preview") { preview }
          tab(name: "Source", testid: "tab-source") do
            render Views::Examples::Code.new(@example.example_source, lexer: :ruby)
          end
        end
      end

      private

      def tab(name:, testid:, checked: false, &content)
        input(type: "radio", name: "component_tabs", role: "tab",
              class: "tab", aria_label: name, checked: checked,
              data: { testid: testid })
        div(role: "tabpanel", class: "tab-content border-base-300 bg-base-100 p-4",
            data: { testid: "#{testid}-panel" }, &content)
      end

      def preview
        div(
          class: "flex flex-wrap items-center gap-3 rounded-box border border-base-300 p-6 min-h-32",
          style: PREVIEW_STYLE,
          data: { testid: "live-preview" }
        ) do
          render @example
        end
      end
    end
  end
end
