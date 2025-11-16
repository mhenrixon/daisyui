# frozen_string_literal: true

module PhlexyUI
  # @component html class="join"
  class Pagination < Base
    self.component_class = "join"

    def initialize(*, as: :div, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def item(**opts, &)
      div(class: component_classes("join-item", options: opts), **opts, &)
    end

    register_modifiers(
      # "sm:join-vertical"
      # "@sm:join-vertical"
      # "md:join-vertical"
      # "@md:join-vertical"
      # "lg:join-vertical"
      # "@lg:join-vertical"
      vertical: "join-vertical",
      # "sm:join-horizontal"
      # "@sm:join-horizontal"
      # "md:join-horizontal"
      # "@md:join-horizontal"
      # "lg:join-horizontal"
      # "@lg:join-horizontal"
      horizontal: "join-horizontal"
    )
  end
end
