# frozen_string_literal: true

module PhlexyUI
  # @component html class="validator"
  class Validator < Base
    def initialize(*, as: :input, **)
      super(*, **)
      @as = as
    end

    def view_template(&block)
      public_send(as, class: classes, **attributes, &block)
    end

    def hint(**options, &block)
      p(class: component_classes("validator-hint", from: opts), **opts, &block)
    end
  end
end
