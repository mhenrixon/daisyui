# frozen_string_literal: true

module PhlexyUI
  # @private
  class MenuItem < Base
    self.component_class = nil

    def view_template(&)
      li(class: classes, **attributes, &)
    end

    def title(*, **options, &block)
      h2(class: component_classes("menu-title", options: options), **options, &block)
    end

    def submenu(*modifiers, **opts, &)
      if modifiers.include?(:collapsible)
        render CollapsibleSubMenu.new(*modifiers, **opts, &)
      else
        render SubMenu.new(*modifiers, **opts, &)
      end
    end

    private

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
