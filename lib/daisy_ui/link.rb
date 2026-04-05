# frozen_string_literal: true

module DaisyUI
  class Link < Base
    self.component_class = "link"

    def view_template(&)
      a(class: classes, **attributes, &)
    end

    register_modifiers(
      # Style
      # "sm:link-hover" "md:link-hover" "lg:link-hover"
      hover: "link-hover",
      # Colors
      # "sm:link-neutral" "md:link-neutral" "lg:link-neutral"
      neutral: "link-neutral",
      # "sm:link-primary" "md:link-primary" "lg:link-primary"
      primary: "link-primary",
      # "sm:link-secondary" "md:link-secondary" "lg:link-secondary"
      secondary: "link-secondary",
      # "sm:link-accent" "md:link-accent" "lg:link-accent"
      accent: "link-accent",
      # "sm:link-info" "md:link-info" "lg:link-info"
      info: "link-info",
      # "sm:link-success" "md:link-success" "lg:link-success"
      success: "link-success",
      # "sm:link-warning" "md:link-warning" "lg:link-warning"
      warning: "link-warning",
      # "sm:link-error" "md:link-error" "lg:link-error"
      error: "link-error"
    ).freeze
  end
end
