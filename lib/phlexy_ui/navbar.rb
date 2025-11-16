# frozen_string_literal: true

module PhlexyUI
  class Navbar < Base
    self.component_class = :navbar

    def initialize(*, as: :nav, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def start(*, as: :div, **opts, &)
      public_send(as, class: component_classes("navbar-start", options: opts), **opts, &)
    end

    def center(*, as: :div, **opts, &)
      public_send(as, class: component_classes("navbar-center", options: opts), **opts, &)
    end

    def end(*, as: :div, **opts, &)
      public_send(as, class: component_classes("navbar-end", options: opts), **opts, &)
    end

    register_modifiers(
      **COLOR_MODIFIERS
    )
  end
end
