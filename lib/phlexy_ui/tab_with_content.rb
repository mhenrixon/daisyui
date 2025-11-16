# frozen_string_literal: true

module PhlexyUI
  # @private
  class TabWithContent < Base
    def initialize(*base_modifiers, content:, id: nil, **)
      super(*base_modifiers, **)
      @title = title
      @id = id
      @content = content
    end

    def view_template
      attrs = generate_attributes(
        base_modifiers,
        options,
        ATTRIBUTES_MAP
      )

      input(
        type: :radio,
        name:,
        role: :tab,
        class: classes,
        aria: {label:},
        **options.except(*ATTRIBUTES_MAP.keys),
        **attrs
      )

      if content
        @content = -> do
          div(class: component_classes("tab-content", from: content_options), **content_options, &content_block)
        end
      end
    end
  end
end
