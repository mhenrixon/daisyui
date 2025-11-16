# frozen_string_literal: true

module PhlexyUI
  # @component html class="validator"
  class Validator < Base
    self.component_class = :validator

    def initialize(*, as: :input, **)
      super
    end

    def view_template(&block)
      block&.call(self)

      public_send(as, class: classes, **attributes)

      # Render hint if it was set
      @hint&.call
    end

    def hint(**options, &block)
      @hint = -> { p(class: component_classes("validator-hint", options: options), **options, &block) }
    end
  end
end
