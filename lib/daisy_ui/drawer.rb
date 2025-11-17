# frozen_string_literal: true

module DaisyUI
  class Drawer < Base
    self.component_class = :drawer

    def initialize(*, id:, as: :section, **)
      super
      @id = id
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def toggle(**options, &)
      toggle_classes = component_classes("drawer-toggle", options:)
      input(id:, type: :checkbox, class: toggle_classes, **options, &)
    end

    def content(as: :div, **options, &)
      public_send(as, class: component_classes("drawer-content", options:), **options, &)
    end

    def side(as: :div, **options, &)
      public_send(as, class: component_classes("drawer-side", options:), **options, &)
    end

    def overlay(**options, &)
      overlay_classes = component_classes("drawer-overlay", options:)
      label(for: id, class: overlay_classes, **options, &)
    end

    def button(*, **, &)
      render Button.new(*, as: :label, for: id, **, &)
    end

    private

    # Override Base#attributes to exclude :id from the main drawer element.
    # The Drawer component requires an :id parameter, but it's used internally
    # to wire up the toggle checkbox, overlay, and button elements - NOT for
    # the main drawer container.
    def attributes
      options
    end

    register_modifiers(
        # "sm:drawer-end"
        # "@sm:drawer-end"
        # "md:drawer-end"
        # "@md:drawer-end"
        # "lg:drawer-end"
        # "@lg:drawer-end"
        # "xl:drawer-end"
        # "@xl:drawer-end"
      end: "drawer-end",
      # "sm:drawer-open"
      # "@sm:drawer-open"
      # "md:drawer-open"
      # "@md:drawer-open"
      # "lg:drawer-open"
      # "@lg:drawer-open"
      # "xl:drawer-open"
      # "@xl:drawer-open"
      open: "drawer-open"
    )
  end
end
