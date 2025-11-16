# frozen_string_literal: true

module PhlexyUI
  # @component html class="mockup-browser"
  class MockupBrowser < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def toolbar(**opts, &)
      div(class: component_classes("mockup-browser-toolbar", from: opts), **opts, &)
    end
  end
end
