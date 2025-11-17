# frozen_string_literal: true

module DaisyUI
  class Modal < Base
    self.component_class = :modal

    def initialize(*, id:, **)
      super(*, **)
      @id = id
    end

    def view_template(&block)
      dialog(id:, class: classes, **attributes) do
        block&.call(self)
        # Auto-render backdrop if tap_outside_to_close modifier is present
        backdrop if modifiers.include?(:tap_outside_to_close)
      end
    end

    def body(*, as: :div, **options, &)
      public_send(as, class: component_classes("modal-box", options:), **options, &)
    end

    def action(*, as: :div, **options, &block)
      action_classes = component_classes("modal-action", options:)
      public_send(as, class: action_classes, **options) do
        block&.call(self)
      end
    end

    def backdrop(*, **options, &)
      backdrop_classes = component_classes("modal-backdrop", options:)
      form method: :dialog, class: backdrop_classes, **options do
        button
      end
    end

    def close_button(*, **, &)
      form method: :dialog do
        render DaisyUI::Button.new(*, **, &)
      end
    end

    register_modifiers(
      # "sm:modal-open"
      # "@sm:modal-open"
      # "md:modal-open"
      # "@md:modal-open"
      # "lg:modal-open"
      # "@lg:modal-open"
      open: "modal-open",
      # "sm:modal-top"
      # "@sm:modal-top"
      # "md:modal-top"
      # "@md:modal-top"
      # "lg:modal-top"
      # "@lg:modal-top"
      top: "modal-top",
      # "sm:modal-bottom"
      # "@sm:modal-bottom"
      # "md:modal-bottom"
      # "@md:modal-bottom"
      # "lg:modal-bottom"
      # "@lg:modal-bottom"
      bottom: "modal-bottom",
      # "sm:modal-middle"
      # "@sm:modal-middle"
      # "md:modal-middle"
      # "@md:modal-middle"
      # "lg:modal-middle"
      # "@lg:modal-middle"
      middle: "modal-middle"
    )
  end
end
