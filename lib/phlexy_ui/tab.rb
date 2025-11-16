# frozen_string_literal: true

module PhlexyUI
  # @private
  class Tab < Base
    def initialize(*modifiers, label: nil, id: nil, **options)
      super(*modifiers, **options)
      @label = label
      @id = id
    end

    def view_template(&block)
      block.call(self) if block

      if @content
        render TabWithContent.new(
          *modifiers,
          label: @label,
          id:,
          content: @content,
          **options
        )
      else
        render TabWithoutContent.new(*modifiers, label: @label, **options)
      end
    end

    def content(*, **opts, &block)
      unless id
        raise ArgumentError,
          "You must pass an id to Tabs#new if you want to add content"
      end

      @content = -> do
        content_classes = component_classes("tab-content", from: opts)
        div role: :tabpanel, class: content_classes, **opts, &block
      end
    end
  end
end
