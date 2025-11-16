# frozen_string_literal: true

module PhlexyUI
  # @component html class="diff"
  class Diff < Base
    def initialize(*, as: :figure, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def item_1(**opts, &)
      div(class: component_classes("diff-item-1", from: opts), **opts, &)
    end

    def item_2(**opts, &)
      div(class: component_classes("diff-item-2", from: opts), **opts, &)
    end

    def resizer(**opts, &)
      div(class: component_classes("diff-resizer", from: opts), **opts, &)
    end
  end
end
