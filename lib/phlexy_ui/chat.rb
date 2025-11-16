# frozen_string_literal: true

module PhlexyUI
  # @component html class="chat"
  class Chat < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def image(**opts, &)
      div(class: component_classes("chat-image", from: opts), **opts, &)
    end

    def header(**opts, &)
      div(class: component_classes("chat-header", from: opts), **opts, &)
    end

    def bubble(**opts, &)
      div(class: component_classes("chat-bubble", from: opts), **opts, &)
    end

    def footer(**opts, &)
      div(class: component_classes("chat-footer", from: opts), **opts, &)
    end

    register_modifiers(
      # "sm:chat-start"
      # "@sm:chat-start"
      # "md:chat-start"
      # "@md:chat-start"
      # "lg:chat-start"
      # "@lg:chat-start"
      start: "chat-start",
        # "sm:chat-end"
        # "@sm:chat-end"
        # "md:chat-end"
        # "@md:chat-end"
        # "lg:chat-end"
        # "@lg:chat-end"
      end: "chat-end"
    )
  end
end
