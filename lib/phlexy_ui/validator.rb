# frozen_string_literal: true

module PhlexyUI
  # @component html class="validator"
  class Validator < Base
    def initialize(*, as: :input, **)
      super(*, **)
      @as = as
    end

    def view_template(&block)
      block.call(self) if block

      public_send(as, class: classes, **attributes)

      # Render hint if it was set
      @hint.call if @hint
    end

    def hint(**options, &block)
      @hint = -> { p(class: component_classes("validator-hint", from: options), **options, &block) }
    end
  end
end
