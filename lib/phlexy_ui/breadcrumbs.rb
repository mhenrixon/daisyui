# frozen_string_literal: true

module PhlexyUI
  class Breadcrumbs < Base
    component :breadcrumbs

    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "breadcrumbs"
        component_html_class: :breadcrumbs,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options) do
          ul(&)
        end
      end
    end

    def crumb(**options, &)
      # Don't use component class for child items, just pass through options
      li(class: options.delete(:class), **options, &)
    end
    alias_method :breadcrumb, :crumb
    alias_method :item, :crumb

    register_modifiers({})
  end
end
