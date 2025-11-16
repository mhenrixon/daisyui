# frozen_string_literal: true

module PhlexyUI
  class Drawer < Base
    self.component_class = :drawer

    def initialize(*, id:, as: :section, **)
      super
      @id = id
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def toggle(**opts, &)
      toggle_classes = component_classes("drawer-toggle", options: opts)
      input(id:, type: :checkbox, class: toggle_classes, **opts, &)
    end

    def content(as: :div, **options, &)
      public_send(as, class: component_classes("drawer-content", options: options), **options, &)
    end

    def side(as: :div, **options, &)
      public_send(as, class: component_classes("drawer-side", options: options), **options, &)
    end

    def overlay(**options, &)
      overlay_classes = component_classes("drawer-overlay", options: options)
      label(for: id, class: overlay_classes, **options, &)
    end

    def button(*, **, &)
      render Button.new(*, as: :label, for: id, **, &)
    end

    private

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
