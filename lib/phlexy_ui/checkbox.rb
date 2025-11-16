# frozen_string_literal: true

module PhlexyUI
  class Checkbox < Base
    self.component_class = :checkbox

    def view_template(&)
      input(
        type: :checkbox,
        class: classes,
        **attributes,
        &
      )
    end

    private

    def attributes
      attrs = super

      # Remove checkbox-specific boolean attributes from base attrs
      checked = modifiers.include?(:checked) || attrs.delete(:checked) == true
      disabled = modifiers.include?(:disabled) || attrs.delete(:disabled) == true

      # Add them back in the correct order: checked first, then disabled
      attrs[:checked] = true if checked
      attrs[:disabled] = true if disabled

      attrs
    end

    register_modifiers(
      # "sm:checkbox-primary"
      # "@sm:checkbox-primary"
      # "md:checkbox-primary"
      # "@md:checkbox-primary"
      # "lg:checkbox-primary"
      # "@lg:checkbox-primary"
      primary: "checkbox-primary",
      # "sm:checkbox-secondary"
      # "@sm:checkbox-secondary"
      # "md:checkbox-secondary"
      # "@md:checkbox-secondary"
      # "lg:checkbox-secondary"
      # "@lg:checkbox-secondary"
      secondary: "checkbox-secondary",
      # "sm:checkbox-accent"
      # "@sm:checkbox-accent"
      # "md:checkbox-accent"
      # "@md:checkbox-accent"
      # "lg:checkbox-accent"
      # "@lg:checkbox-accent"
      accent: "checkbox-accent",
      # "sm:checkbox-success"
      # "@sm:checkbox-success"
      # "md:checkbox-success"
      # "@md:checkbox-success"
      # "lg:checkbox-success"
      # "@lg:checkbox-success"
      success: "checkbox-success",
      # "sm:checkbox-warning"
      # "@sm:checkbox-warning"
      # "md:checkbox-warning"
      # "@md:checkbox-warning"
      # "lg:checkbox-warning"
      # "@lg:checkbox-warning"
      warning: "checkbox-warning",
      # "sm:checkbox-info"
      # "@sm:checkbox-info"
      # "md:checkbox-info"
      # "@md:checkbox-info"
      # "lg:checkbox-info"
      # "@lg:checkbox-info"
      info: "checkbox-info",
      # "sm:checkbox-error"
      # "@sm:checkbox-error"
      # "md:checkbox-error"
      # "@md:checkbox-error"
      # "lg:checkbox-error"
      # "@lg:checkbox-error"
      error: "checkbox-error",
      # "sm:checkbox-lg"
      # "@sm:checkbox-lg"
      # "md:checkbox-lg"
      # "@md:checkbox-lg"
      # "lg:checkbox-lg"
      # "@lg:checkbox-lg"
      lg: "checkbox-lg",
      # "sm:checkbox-md"
      # "@sm:checkbox-md"
      # "md:checkbox-md"
      # "@md:checkbox-md"
      # "lg:checkbox-md"
      # "@lg:checkbox-md"
      md: "checkbox-md",
      # "sm:checkbox-sm"
      # "@sm:checkbox-sm"
      # "md:checkbox-sm"
      # "@md:checkbox-sm"
      # "lg:checkbox-sm"
      # "@lg:checkbox-sm"
      sm: "checkbox-sm",
      # "sm:checkbox-xs"
      # "@sm:checkbox-xs"
      # "md:checkbox-xs"
      # "@md:checkbox-xs"
      # "lg:checkbox-xs"
      # "@lg:checkbox-xs"
      xs: "checkbox-xs"
    )
  end
end
