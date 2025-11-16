# frozen_string_literal: true

module PhlexyUI
  # @component html class="swap"
  class Swap < Base
    self.component_class = :swap

    def initialize(*, as: :label, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def on(**opts, &)
      div(class: component_classes("swap-on", options: opts), **opts, &)
    end

    def off(**opts, &)
      div(class: component_classes("swap-off", options: opts), **opts, &)
    end

    def indeterminate(**opts, &)
      div(class: component_classes("swap-indeterminate", options: opts), **opts, &)
    end

    register_modifiers(
      # "sm:swap-active"
      # "@sm:swap-active"
      # "md:swap-active"
      # "@md:swap-active"
      # "lg:swap-active"
      # "@lg:swap-active"
      active: "swap-active",
      # "sm:swap-rotate"
      # "@sm:swap-rotate"
      # "md:swap-rotate"
      # "@md:swap-rotate"
      # "lg:swap-rotate"
      # "@lg:swap-rotate"
      rotate: "swap-rotate",
      # "sm:swap-flip"
      # "@sm:swap-flip"
      # "md:swap-flip"
      # "@md:swap-flip"
      # "lg:swap-flip"
      # "@lg:swap-flip"
      flip: "swap-flip"
    )
  end
end
