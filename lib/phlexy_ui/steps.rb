# frozen_string_literal: true

module PhlexyUI
  # @component html class="steps"
  class Steps < Base
    def initialize(*, as: :ul, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def step(**opts, &)
      li(class: component_classes("step", from: opts), **opts, &)
    end

    def icon(**opts, &)
      div(class: component_classes("step-icon", from: opts), **opts, &)
    end

    register_modifiers(
      # "sm:steps-vertical"
      # "@sm:steps-vertical"
      # "md:steps-vertical"
      # "@md:steps-vertical"
      # "lg:steps-vertical"
      # "@lg:steps-vertical"
      vertical: "steps-vertical",
      # "sm:steps-horizontal"
      # "@sm:steps-horizontal"
      # "md:steps-horizontal"
      # "@md:steps-horizontal"
      # "lg:steps-horizontal"
      # "@lg:steps-horizontal"
      horizontal: "steps-horizontal"
    )
  end
end
