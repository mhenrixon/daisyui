# frozen_string_literal: true

module PhlexyUI
  class Base < Phlex::HTML
    class << self
      attr_writer :component_class
      attr_accessor :modifiers

      def component_class
        @component_class ||= begin
          # Convert "PhlexyUI::Button" -> "button"
          class_name = name.split("::").last # demodulize
          class_name.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
            .gsub(/([a-z\d])([A-Z])/, '\1_\2')
            .tr("_", "-")
            .downcase
        end
      end

      def inherited(subclass)
        super
        subclass.modifiers = (modifiers || {}).dup
      end

      def register_modifiers(mods)
        self.modifiers = (modifiers || {}).merge(mods)
      end
    end

    def initialize(*modifiers, as: :div, id: nil, **options)
      @modifiers = modifiers
      @as = as
      @id = id
      @options = options
    end

    private

    attr_reader :modifiers, :options, :as, :id

    # Main extension points - override these in your project!
    def classes
      merge_classes(
        base_class,
        *modifier_classes,
        *responsive_classes,
        options.delete(:class)
      )
    end

    def attributes
      merge_attributes(**options)
    end

    # Simple defaults - easy to override
    def merge_classes(*parts)
      result = parts.compact.join(" ")
      result.empty? ? nil : result
    end

    def merge_attributes(**attrs)
      attrs
    end

    # Core functionality
    def base_class
      apply_prefix(self.class.component_class&.to_s)
    end

    def modifier_classes
      modifiers.filter_map { |m| apply_prefix(modifier_map[m]) }
    end

    def responsive_classes
      return [] unless (resp = options.delete(:responsive))

      resp.flat_map do |breakpoint, mods|
        Array(mods).map { |mod| "#{breakpoint}:#{apply_prefix(modifier_map[mod])}" }
      end
    end

    def modifier_map
      self.class.modifiers || {}
    end

    def apply_prefix(css_class)
      return css_class unless css_class
      return css_class unless (prefix = PhlexyUI.configuration.prefix)

      css_class.split.map { |c| "#{prefix}#{c}" }.join(" ")
    end

    # Helper for sub-components
    def component_classes(*base_classes, from: options)
      prefixed_classes = base_classes.map { |c| apply_prefix(c) }
      merge_classes(*prefixed_classes, from.delete(:class))
    end

    # Deprecated methods for backward compatibility during migration
    def generate_classes!(component_html_class: nil, **_opts)
      component_html_class&.to_s
    end

    def generate_attributes(_base_modifiers, _options, _attributes_map)
      {}
    end
  end
end
