# frozen_string_literal: true

module PhlexyUI
  # @component html class="indicator"
  class Indicator < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def item(**opts, &)
      span(class: component_classes("indicator-item", from: opts), **opts, &)
    end

    register_modifiers(
      # "sm:indicator-start"
      # "@sm:indicator-start"
      # "md:indicator-start"
      # "@md:indicator-start"
      # "lg:indicator-start"
      # "@lg:indicator-start"
      start: "indicator-start",
      # "sm:indicator-center"
      # "@sm:indicator-center"
      # "md:indicator-center"
      # "@md:indicator-center"
      # "lg:indicator-center"
      # "@lg:indicator-center"
      center: "indicator-center",
        # "sm:indicator-end"
        # "@sm:indicator-end"
        # "md:indicator-end"
        # "@md:indicator-end"
        # "lg:indicator-end"
        # "@lg:indicator-end"
      end: "indicator-end",
      # "sm:indicator-top"
      # "@sm:indicator-top"
      # "md:indicator-top"
      # "@md:indicator-top"
      # "lg:indicator-top"
      # "@lg:indicator-top"
      top: "indicator-top",
      # "sm:indicator-middle"
      # "@sm:indicator-middle"
      # "md:indicator-middle"
      # "@md:indicator-middle"
      # "lg:indicator-middle"
      # "@lg:indicator-middle"
      middle: "indicator-middle",
      # "sm:indicator-bottom"
      # "@sm:indicator-bottom"
      # "md:indicator-bottom"
      # "@md:indicator-bottom"
      # "lg:indicator-bottom"
      # "@lg:indicator-bottom"
      bottom: "indicator-bottom"
    )
  end
end
