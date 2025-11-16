# frozen_string_literal: true

module PhlexyUI
  # @component html class="stats"
  class Stat < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def item(**opts, &)
      div(class: component_classes("stat-title", from: opts), **opts, &)
    end

    def value(**opts, &)
      div(class: component_classes("stat-value", from: opts), **opts, &)
    end

    def desc(**opts, &)
      div(class: component_classes("stat-desc", from: opts), **opts, &)
    end

    def figure(**opts, &)
      div(class: component_classes("stat-figure", from: opts), **opts, &)
    end

    def actions(**opts, &)
      div(class: component_classes("stat-actions", from: opts), **opts, &)
    end

    register_modifiers(
      # "sm:stats-horizontal"
      # "@sm:stats-horizontal"
      # "md:stats-horizontal"
      # "@md:stats-horizontal"
      # "lg:stats-horizontal"
      # "@lg:stats-horizontal"
      horizontal: "stats-horizontal",
      # "sm:stats-vertical"
      # "@sm:stats-vertical"
      # "md:stats-vertical"
      # "@md:stats-vertical"
      # "lg:stats-vertical"
      # "@lg:stats-vertical"
      vertical: "stats-vertical"
    )
  end
end
