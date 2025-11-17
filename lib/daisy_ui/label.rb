# frozen_string_literal: true

module DaisyUI
  # Label component for wrapping inputs, selects, or creating floating labels
  #
  # @example Floating label
  #   DaisyUI::Label.new(:floating) do
  #     input(type: "text", placeholder: "Email", class: "input input-md")
  #     span { "Your Email" }
  #   end
  #
  # @example Input wrapper with label
  #   DaisyUI::Label.new(:input) do |label|
  #     label.text("https://")
  #     input(type: "text", placeholder: "URL")
  #   end
  #
  # @example Select wrapper with label
  #   DaisyUI::Label.new(:select) do |label|
  #     label.text("Type")
  #     select do
  #       option { "Personal" }
  #       option { "Business" }
  #     end
  #   end
  class Label < Base
    # No default component_class - it varies based on usage
    # (floating-label, input, or select)
    self.component_class = nil

    register_modifiers(
      # "sm:floating-label"
      # "md:floating-label"
      # "lg:floating-label"
      floating: "floating-label",
      # "sm:input"
      # "md:input"
      # "lg:input"
      input: "input",
      # "sm:select"
      # "md:select"
      # "lg:select"
      select: "select"
    )

    def view_template(&)
      label(class: classes, **attributes, &)
    end

    # Renders label text for input/select wrappers
    # For floating labels, use a plain span instead
    #
    # @example
    #   label.text("Username")
    #   label.text { "Email Address" }
    #   label.text("https://", class: "custom-class")
    def text(content = nil, **options)
      span(class: component_classes("label", options:), **options) do
        content || yield
      end
    end
  end
end
