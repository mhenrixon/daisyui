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
      # "sm:menu-disabled" "md:menu-disabled" "lg:menu-disabled"
      disabled: "menu-disabled",
      # "sm:menu-active" "md:menu-active" "lg:menu-active"
      active: "menu-active",
      # "sm:menu-focus" "md:menu-focus" "lg:menu-focus"
      focus: "menu-focus"
    )
  end
end
