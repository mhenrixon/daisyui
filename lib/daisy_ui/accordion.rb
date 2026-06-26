# frozen_string_literal: true

module DaisyUI
  # @component html class="collapse"
  class Accordion < Base
    self.component_class = :collapse

    def initialize(*, name:, checked: false, as: :div, **)
      super(*, as:, **)
      @name = name
      @checked = checked
    end

    def view_template(&block)
      public_send(as, class: classes, **attributes) do
        input(type: :radio, name:, checked:)
        div(class: component_classes("collapse-title", options: title_options || {}), &title_block) if title_block
        div(class: component_classes("collapse-content", options: {}), &block) if block
      end
    end

    def title(**options, &block)
      @title_options = options
      @title_block = block
    end

    private

    attr_reader :name, :checked, :title_block, :title_options

    register_modifiers(
      # "sm:collapse-arrow"
      # "md:collapse-arrow"
      # "lg:collapse-arrow"
      arrow: "collapse-arrow",
      # "sm:collapse-plus"
      # "md:collapse-plus"
      # "lg:collapse-plus"
      plus: "collapse-plus",
      # "sm:collapse-open"
      # "md:collapse-open"
      # "lg:collapse-open"
      open: "collapse-open",
      # "sm:collapse-close"
      # "md:collapse-close"
      # "lg:collapse-close"
      close: "collapse-close"
    )
  end
end
