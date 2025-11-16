# frozen_string_literal: true

module PhlexyUI
  class Dropdown < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      if modifiers.include?(:tap_to_close)
        details(class: classes, **attributes, &)
      else
        public_send(as, class: classes, **attributes, &)
      end
    end

    def button(*, **, &)
      if modifiers.include?(:tap_to_close)
        render Button.new(*, as: :summary, **, &)
      else
        render Button.new(*, as: :div, role: :button, tabindex: 0, **, &)
      end
    end

    def content(*, as: :div, **opts, &)
      content_classes = component_classes("dropdown-content", from: opts)

      if modifiers.include?(:tap_to_close)
        render_as(*, as:, class: content_classes, **opts, &)
      else
        render_as(*, as:, tabindex: 0, class: content_classes, **opts, &)
      end
    end

    def menu(*, **opts, &)
      menu_classes = component_classes("dropdown-content", from: opts)

      if modifiers.include?(:tap_to_close)
        render Menu.new(*, class: menu_classes, **opts, &)
      else
        render Menu.new(*, tabindex: 0, class: menu_classes, **opts, &)
      end
    end

    private

    register_modifiers(
        # "sm:dropdown-end"
        # "@sm:dropdown-end"
        # "md:dropdown-end"
        # "@md:dropdown-end"
        # "lg:dropdown-end"
        # "@lg:dropdown-end"
      end: "dropdown-end",
      # "sm:dropdown-top"
      # "@sm:dropdown-top"
      # "md:dropdown-top"
      # "@md:dropdown-top"
      # "lg:dropdown-top"
      # "@lg:dropdown-top"
      top: "dropdown-top",
      # "sm:dropdown-bottom"
      # "@sm:dropdown-bottom"
      # "md:dropdown-bottom"
      # "@md:dropdown-bottom"
      # "lg:dropdown-bottom"
      # "@lg:dropdown-bottom"
      bottom: "dropdown-bottom",
      # "sm:dropdown-left"
      # "@sm:dropdown-left"
      # "md:dropdown-left"
      # "@md:dropdown-left"
      # "lg:dropdown-left"
      # "@lg:dropdown-left"
      left: "dropdown-left",
      # "sm:dropdown-right"
      # "@sm:dropdown-right"
      # "md:dropdown-right"
      # "@md:dropdown-right"
      # "lg:dropdown-right"
      # "@lg:dropdown-right"
      right: "dropdown-right",
      # "sm:dropdown-hover"
      # "@sm:dropdown-hover"
      # "md:dropdown-hover"
      # "@md:dropdown-hover"
      # "lg:dropdown-hover"
      # "@lg:dropdown-hover"
      hover: "dropdown-hover",
      # "sm:dropdown-open"
      # "@sm:dropdown-open"
      # "md:dropdown-open"
      # "@md:dropdown-open"
      # "lg:dropdown-open"
      # "@lg:dropdown-open"
      open: "dropdown-open"
    )
  end
end
