# frozen_string_literal: true

module DaisyUI
  class Breadcrumbs < Base
    self.component_class = :breadcrumbs

    def view_template(&)
      public_send(as, class: classes, **attributes) do
        ul(&)
      end
    end

    def crumb(**options, &)
      li(class: component_classes(options: options), **options, &)
    end
    alias breadcrumb crumb
    alias item crumb

    register_modifiers({})
  end
end
