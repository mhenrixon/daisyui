# frozen_string_literal: true

module PhlexyUI
  class Breadcrumbs < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes) do
        ul(&)
      end
    end

    def crumb(**opts, &)
      li(class: component_classes(from: opts), **opts, &)
    end
    alias_method :breadcrumb, :crumb
    alias_method :item, :crumb

    register_modifiers({})
  end
end
