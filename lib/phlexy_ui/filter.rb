# frozen_string_literal: true

module PhlexyUI
  # @component html class="filter"
  class Filter < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def reset(**opts, &)
      generate_classes!(
        # "filter-reset"
        component_html_class: :"filter-reset",
        options:
      ).then do |classes|
        input(type: :radio, class: classes, **options, &)
      end
    end
  end
end
