# frozen_string_literal: true

module PhlexyUI
  # @component html class="cally" or class="pika-single"
  # Supports Cally web component and Pikaday date picker
  class Calendar < Base
    # Register custom web component elements
    register_element :calendar_date
    register_element :calendar_month

    def initialize(*, type: :cally, **)
      super(*, **)
      @type = type
    end

    def view_template(&)
      case type
      when :cally
        render_cally(&)
      when :pikaday
        render_pikaday
      end
    end

    private

    attr_reader :type

    def render_cally(&block)
      calendar_date(class: classes, **attributes, &block)
    end

    def render_pikaday
      input(type: :text, class: classes, **attributes)
    end

    def base_class
      case type
      when :cally
        "cally"
      when :pikaday
        "input pika-single"
      end
    end
  end
end
