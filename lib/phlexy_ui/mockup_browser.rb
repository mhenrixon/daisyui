# frozen_string_literal: true

module PhlexyUI
  # @component html class="mockup-browser"
  class MockupBrowser < Base
    self.component_class = "mockup-browser"

    def initialize(*, as: :div, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def toolbar(**opts, &)
      div(class: component_classes("mockup-browser-toolbar", options: opts), **opts, &)
    end
  end
end
