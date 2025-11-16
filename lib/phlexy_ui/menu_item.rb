# frozen_string_literal: true

module PhlexyUI
  # @private
  class MenuItem < Base
    def view_template(&)
      li(class: classes, **attributes, &)
    end

    def title(*, **options, &block)
      h2(class: component_classes("menu-title", from: opts), **opts, &block)
    end

    def submenu(*base_modifiers, **, &)
      if base_modifiers.include?(:collapsible)
        render CollapsibleSubMenu.new(*base_modifiers, **, &)
      else
        render SubMenu.new(*base_modifiers, **, &)
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
