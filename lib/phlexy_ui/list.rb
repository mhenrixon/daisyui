# frozen_string_literal: true

module PhlexyUI
  # @component html class="list"
  class List < Base
    def initialize(*, as: :ul, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def row(**opts, &)
      li(class: component_classes("list-row", from: opts), **opts, &)
    end

    register_modifiers(
      # "sm:list-col-wrap"
      # "@sm:list-col-wrap"
      # "md:list-col-wrap"
      # "@md:list-col-wrap"
      # "lg:list-col-wrap"
      # "@lg:list-col-wrap"
      col_wrap: "list-col-wrap",
      # "sm:list-col-grow"
      # "@sm:list-col-grow"
      # "md:list-col-grow"
      # "@md:list-col-grow"
      # "lg:list-col-grow"
      # "@lg:list-col-grow"
      col_grow: "list-col-grow"
    )
  end
end
