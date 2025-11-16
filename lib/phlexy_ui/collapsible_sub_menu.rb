# frozen_string_literal: true

module PhlexyUI
  # @private
  class CollapsibleSubMenu < Base
    self.component_class = nil

    def initialize(*, **)
      super
      @items ||= []
    end

    def view_template(&block)
      block&.call(self)

      # Extract 'open' attribute for the details element
      details_attrs = {}
      details_attrs[:open] = true if modifiers.include?(:open) || options.delete(:open) == true

      details(**details_attrs) do
        if @title
          summary do
            render @title
          end
        else
          raise ArgumentError, "A collapsible submenu requires a title"
        end

        if @items.any?
          ul class: classes, **attributes do
            @items.each do |item|
              render item
            end
          end
        end
      end
    end

    def title(&block)
      if @title
        raise ArgumentError, "A collapsible submenu can only have one title"
      else
        @title = block
      end
    end

    def item(*, **, &)
      @items << MenuItem.new(*, **, &)
    end

    private

    register_modifiers(COLOR_MODIFIERS)
  end
end
