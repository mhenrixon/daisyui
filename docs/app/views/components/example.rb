# frozen_string_literal: true

module Views
  module Components
    # Base class for a component-reference example. A subclass renders a live
    # daisyUI component (via the gem) in #example; the Show page shows that live
    # render in a "Preview" tab and the extracted #example source in a "Source"
    # tab, so the shown code and the running component never drift.
    #
    #   class Views::Components::Examples::Button < Views::Components::Example
    #     include DaisyUI
    #     def title = "Button"
    #     def example
    #       Button { "Click me" }
    #       Button(:primary) { "Primary" }
    #     end
    #   end
    class Example < Phlex::HTML
      # The component title shown on the page (defaults to the demangled class
      # name, e.g. "Button").
      def title
        self.class.name.demodulize.titleize
      end

      # Override with the live component render(s) to demonstrate.
      def example
        raise NotImplementedError, "#{self.class} must implement #example"
      end

      # The Ruby source of #example, extracted via method_source. Drives the
      # "Source" tab. The first and last lines (def/end) are stripped so the tab
      # shows just the body a host would write.
      def example_source
        source = method(:example).source
        source.sub(/\A.*\n/, "").sub(/\n[^\n]*\z/, "").gsub(/^      /, "").strip
      end

      # This class is rendered by Views::Components::Show, not directly, so
      # view_template just renders the example body for the live preview.
      def view_template
        example
      end
    end
  end
end
