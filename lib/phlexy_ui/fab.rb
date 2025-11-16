# frozen_string_literal: true

module PhlexyUI
  # @component html class="fab"
  class Fab < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def close(**opts, &)
      div(class: component_classes("fab-close", from: opts), **opts, &)
    end

    def main_action(**opts, &)
      div(class: component_classes("fab-main-action", from: opts), **opts, &)
    end

    register_modifiers(
      # "sm:fab-flower"
      # "@sm:fab-flower"
      # "md:fab-flower"
      # "@md:fab-flower"
      # "lg:fab-flower"
      # "@lg:fab-flower"
      flower: "fab-flower"
    )
  end
end
