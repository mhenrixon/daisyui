# frozen_string_literal: true

module PhlexyUI
  class Modal < Base
    def initialize(*, id:, **)
      super(*, **)
      @id = id
    end

    def view_template(&)
      dialog(id:, class: classes, **attributes, &)
    end

    def body(*, as: :div, **opts, &)
      public_send(as, class: component_classes("modal-action", from: opts), **opts, &)
    end

    def backdrop(*, **opts, &)
      generate_classes!(
        # "modal-backdrop"
        component_html_class: :"modal-backdrop",
        options:
      ).then do |classes|
        form method: :dialog, class: classes, **options do
          button
        end
      end
    end

    def close_button(*, **, &)
      form method: :dialog do
        render PhlexyUI::Button.new(*, **, &)
      end
    end

    private

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
