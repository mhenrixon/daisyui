# frozen_string_literal: true

module PhlexyUI
  class Base < Phlex::HTML
    class << self
      attr_writer :component_class
      attr_accessor :modifiers

      def component_class
        return @component_class if instance_variable_defined?(:@component_class)

        @component_class = begin
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
        # Inherit component_class if it was explicitly set
        if instance_variable_defined?(:@component_class)
          subclass.component_class = @component_class
        end
      end

      def register_modifiers(mods)
        self.modifiers = (modifiers || {}).merge(mods)
      end
    end

    def initialize(*modifiers, as: :div, id: nil, **options)
      # Extract boolean modifiers from options (e.g., primary: true, secondary: false)
      boolean_modifiers = extract_boolean_modifiers(options)

      @modifiers = modifiers + boolean_modifiers
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
      # If responsive option includes `true`, base class should only appear with responsive prefix
      if options[:responsive]&.values&.any? { |mods| Array(mods).include?(true) }
        return nil
      end

      apply_prefix(self.class.component_class&.to_s)
    end

    def modifier_classes
      modifiers.filter_map { |m| apply_prefix(modifier_map[m]) }
    end

    def responsive_classes
      return [] unless (resp = options.delete(:responsive))

      resp.flat_map do |breakpoint, mods|
        Array(mods).flat_map do |mod|
          # Handle `true` as a special value to apply responsive to base class
          if mod == true
            base_class_value = self.class.component_class
            next unless base_class_value

            "#{breakpoint}:#{apply_prefix(base_class_value)}"
          else
            # Get the modifier classes (may be multiple like "bg-primary text-primary-content")
            modifier_classes = modifier_map[mod]
            next unless modifier_classes

            # Split and apply breakpoint prefix to each class
            modifier_classes.split.map do |css_class|
              "#{breakpoint}:#{apply_prefix(css_class)}"
            end
          end
        end
      end.compact
    end

    def modifier_map
      {
        skeleton: "skeleton",
        **(self.class.modifiers || {}),
        **PhlexyUI.configuration.modifiers.for(component: self.class),
        **PhlexyUI.configuration.modifiers.for(component: nil)
      }
    end

    def extract_boolean_modifiers(options)
      modifier_keys = modifier_map.keys
      boolean_mods = []

      modifier_keys.each do |key|
        if options.key?(key) && (options[key] == true || options[key] == false)
          boolean_mods << key if options.delete(key) == true
        end
      end

      boolean_mods
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

    def render_as(*, as:, **, &)
      if as.is_a?(Symbol)
        public_send(as, *, **, &)
      else
        render as.new(*, **, &)
      end
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
