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
      reset_classes = component_classes("filter-reset", from: opts)
      input(type: :radio, class: reset_classes, **opts, &)
    end
  end
end
