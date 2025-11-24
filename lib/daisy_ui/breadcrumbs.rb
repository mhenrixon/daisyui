# frozen_string_literal: true

module DaisyUI
  class Breadcrumbs < Base
    self.component_class = :breadcrumbs

    def view_template(&)
      public_send(as, class: classes, **attributes) do
        ul(&)
      end
    end

    def crumb(href: nil, **options, &block)
      li(class: component_classes(options: options), **options) do
        if href
          a(href: href, &block)
        else
          block.call
        end
      end
    end
    alias breadcrumb crumb
    alias item crumb
    alias add crumb

    register_modifiers({})
  end
end
