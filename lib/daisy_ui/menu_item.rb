# frozen_string_literal: true

module DaisyUI
  # @private
  class MenuItem < Base
    self.component_class = nil

    def view_template(&)
      li(class: classes, **attributes, &)
    end

    def title(*, **options, &)
      h2(class: component_classes("menu-title", options:), **options, &)
    end

    def submenu(*modifiers, **, &)
      if modifiers.include?(:collapsible)
        render CollapsibleSubMenu.new(*modifiers, **, &)
      else
        render SubMenu.new(*modifiers, **, &)
      end
    end

    register_modifiers(
      # "sm:disabled"
      # "@sm:disabled"
      # "md:disabled"
      # "@md:disabled"
      # "lg:disabled"
      # "@lg:disabled"
      disabled: "disabled",
      # "sm:active"
      # "@sm:active"
      # "md:active"
      # "@md:active"
      # "lg:active"
      # "@lg:active"
      active: "active",
      # "sm:focus"
      # "@sm:focus"
      # "md:focus"
      # "@md:focus"
      # "lg:focus"
      # "@lg:focus"
      focus: "focus"
    )
  end
end
