# frozen_string_literal: true

module PhlexyUI
  class Drawer < Base
    def initialize(*, id:, as: :section, **)
      super(*, **)
      @as = as
      @id = id
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def toggle(**opts, &)
      generate_classes!(
        # "drawer-toggle"
        component_html_class: :"drawer-toggle",
        options:
      ).then do |classes|
        input(id:, type: :checkbox, class: classes, **options, &)
      end
    end

    def content(as: :div, **options, &)
      public_send(as, class: component_classes("drawer-content", from: opts), **opts, &)
    end

    def side(as: :div, **options, &)
      public_send(as, class: component_classes("drawer-side", from: opts), **opts, &)
    end

    def overlay(**options, &)
      generate_classes!(
        # "drawer-overlay"
        component_html_class: :"drawer-overlay",
        options:
      ).then do |classes|
        label(for: id, class: classes, **options, &)
      end
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
