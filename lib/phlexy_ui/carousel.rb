# frozen_string_literal: true

module PhlexyUI
  # @component html class="carousel"
  class Carousel < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def item(**opts, &)
      div(class: component_classes("carousel-item", from: opts), **opts, &)
    end

    register_modifiers(
      # "sm:carousel-start"
      # "@sm:carousel-start"
      # "md:carousel-start"
      # "@md:carousel-start"
      # "lg:carousel-start"
      # "@lg:carousel-start"
      start: "carousel-start",
      # "sm:carousel-center"
      # "@sm:carousel-center"
      # "md:carousel-center"
      # "@md:carousel-center"
      # "lg:carousel-center"
      # "@lg:carousel-center"
      center: "carousel-center",
        # "sm:carousel-end"
        # "@sm:carousel-end"
        # "md:carousel-end"
        # "@md:carousel-end"
        # "lg:carousel-end"
        # "@lg:carousel-end"
      end: "carousel-end",
      # "sm:carousel-vertical"
      # "@sm:carousel-vertical"
      # "md:carousel-vertical"
      # "@md:carousel-vertical"
      # "lg:carousel-vertical"
      # "@lg:carousel-vertical"
      vertical: "carousel-vertical"
    )
  end
end
