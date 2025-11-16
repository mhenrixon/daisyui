# frozen_string_literal: true

module PhlexyUI
  class Base < Phlex::HTML
    # Shared color modifiers used across multiple components
    # Maps color names to their DaisyUI background/text class combinations
    COLOR_MODIFIERS = {
      # "sm:bg-primary sm:text-primary-content"
      # "@sm:bg-primary @sm:text-primary-content"
      # "md:bg-primary md:text-primary-content"
      # "@md:bg-primary @md:text-primary-content"
      # "lg:bg-primary lg:text-primary-content"
      # "@lg:bg-primary @lg:text-primary-content"
      primary: "bg-primary text-primary-content",
      # "sm:bg-secondary sm:text-secondary-content"
      # "@sm:bg-secondary @sm:text-secondary-content"
      # "md:bg-secondary md:text-secondary-content"
      # "@md:bg-secondary @md:text-secondary-content"
      # "lg:bg-secondary lg:text-secondary-content"
      # "@lg:bg-secondary @lg:text-secondary-content"
      secondary: "bg-secondary text-secondary-content",
      # "sm:bg-accent sm:text-accent-content"
      # "@sm:bg-accent @sm:text-accent-content"
      # "md:bg-accent md:text-accent-content"
      # "@md:bg-accent @md:text-accent-content"
      # "lg:bg-accent lg:text-accent-content"
      # "@lg:bg-accent @lg:text-accent-content"
      accent: "bg-accent text-accent-content",
      # "sm:bg-neutral sm:text-neutral-content"
      # "@sm:bg-neutral @sm:text-neutral-content"
      # "md:bg-neutral md:text-neutral-content"
      # "@md:bg-neutral @md:text-neutral-content"
      # "lg:bg-neutral lg:text-neutral-content"
      # "@lg:bg-neutral @lg:text-neutral-content"
      neutral: "bg-neutral text-neutral-content",
      # "sm:bg-base-100 sm:text-base-content"
      # "@sm:bg-base-100 @sm:text-base-content"
      # "md:bg-base-100 md:text-base-content"
      # "@md:bg-base-100 @md:text-base-content"
      # "lg:bg-base-100 lg:text-base-content"
      # "@lg:bg-base-100 @lg:text-base-content"
      base_100: "bg-base-100 text-base-content",
      # "sm:bg-base-200 sm:text-base-content"
      # "@sm:bg-base-200 @sm:text-base-content"
      # "md:bg-base-200 md:text-base-content"
      # "@md:bg-base-200 @md:text-base-content"
      # "lg:bg-base-200 lg:text-base-content"
      # "@lg:bg-base-200 @lg:text-base-content"
      base_200: "bg-base-200 text-base-content",
      # "sm:bg-base-300 sm:text-base-content"
      # "@sm:bg-base-300 @sm:text-base-content"
      # "md:bg-base-300 md:text-base-content"
      # "@md:bg-base-300 @md:text-base-content"
      # "lg:bg-base-300 lg:text-base-content"
      # "@lg:bg-base-300 @lg:text-base-content"
      base_300: "bg-base-300 text-base-content",
      # "sm:bg-info sm:text-info-content"
      # "@sm:bg-info @sm:text-info-content"
      # "md:bg-info md:text-info-content"
      # "@md:bg-info @md:text-info-content"
      # "lg:bg-info lg:text-info-content"
      # "@lg:bg-info @lg:text-info-content"
      info: "bg-info text-info-content",
      # "sm:bg-success sm:text-success-content"
      # "@sm:bg-success @sm:text-success-content"
      # "md:bg-success md:text-success-content"
      # "@md:bg-success @md:text-success-content"
      # "lg:bg-success lg:text-success-content"
      # "@lg:bg-success @lg:text-success-content"
      success: "bg-success text-success-content",
      # "sm:bg-warning sm:text-warning-content"
      # "@sm:bg-warning @sm:text-warning-content"
      # "md:bg-warning md:text-warning-content"
      # "@md:bg-warning @md:text-warning-content"
      # "lg:bg-warning lg:text-warning-content"
      # "@lg:bg-warning @lg:text-warning-content"
      warning: "bg-warning text-warning-content",
      # "sm:bg-error sm:text-error-content"
      # "@sm:bg-error @sm:text-error-content"
      # "md:bg-error md:text-error-content"
      # "@md:bg-error @md:text-error-content"
      # "lg:bg-error lg:text-error-content"
      # "@lg:bg-error @lg:text-error-content"
      error: "bg-error text-error-content"
    }.freeze

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
    # Builds CSS classes for sub-components, merging with any custom classes
    def component_classes(*base_classes, options: self.options)
      prefixed_classes = base_classes.map { |c| apply_prefix(c) }
      merge_classes(*prefixed_classes, options.delete(:class))
    end

    def render_as(*, as:, **, &)
      if as.is_a?(Symbol)
        public_send(as, *, **, &)
      else
        render as.new(*, **, &)
      end
    end
  end
end
