# frozen_string_literal: true

module PhlexyUI
  # @component html class="timeline"
  class Timeline < Base
    self.component_class = :timeline

    def initialize(*, as: :ul, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def start(**opts, &)
      div(class: component_classes("timeline-start", options: opts), **opts, &)
    end

    def middle(**opts, &)
      div(class: component_classes("timeline-middle", options: opts), **opts, &)
    end

    def end(**opts, &)
      div(class: component_classes("timeline-end", options: opts), **opts, &)
    end

    register_modifiers(
      # "sm:timeline-snap-icon"
      # "@sm:timeline-snap-icon"
      # "md:timeline-snap-icon"
      # "@md:timeline-snap-icon"
      # "lg:timeline-snap-icon"
      # "@lg:timeline-snap-icon"
      snap_icon: "timeline-snap-icon",
      # "sm:timeline-box"
      # "@sm:timeline-box"
      # "md:timeline-box"
      # "@md:timeline-box"
      # "lg:timeline-box"
      # "@lg:timeline-box"
      box: "timeline-box",
      # "sm:timeline-compact"
      # "@sm:timeline-compact"
      # "md:timeline-compact"
      # "@md:timeline-compact"
      # "lg:timeline-compact"
      # "@lg:timeline-compact"
      compact: "timeline-compact",
      # "sm:timeline-vertical"
      # "@sm:timeline-vertical"
      # "md:timeline-vertical"
      # "@md:timeline-vertical"
      # "lg:timeline-vertical"
      # "@lg:timeline-vertical"
      vertical: "timeline-vertical",
      # "sm:timeline-horizontal"
      # "@sm:timeline-horizontal"
      # "md:timeline-horizontal"
      # "@md:timeline-horizontal"
      # "lg:timeline-horizontal"
      # "@lg:timeline-horizontal"
      horizontal: "timeline-horizontal"
    )
  end
end
