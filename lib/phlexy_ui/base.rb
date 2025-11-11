# frozen_string_literal: true

module PhlexyUI
  class Base < Phlex::HTML
    def initialize(*base_modifiers, **options)
      @base_modifiers = base_modifiers
      @options = options
    end

    class << self
      attr_reader :component_name

      # Inherit component_name, base_class, and local_modifiers from parent class
      def inherited(subclass)
        super
        # Copy parent's component_name and base_class to child (can be overridden)
        if @component_name
          subclass.instance_variable_set(:@component_name, @component_name)
          subclass.instance_variable_set(:@component_base_class, @component_base_class)
        end
        # Copy local_modifiers for sub-components
        if @local_modifiers
          subclass.instance_variable_set(:@local_modifiers, @local_modifiers.dup)
        end
      end

      private

      # Set the component name for registry lookup
      # This should be called in each component class
      #
      # @param name [Symbol] the component identifier
      # @param base_class [String, nil] optional base CSS class (defaults to name with underscores as dashes)
      # @return [void]
      #
      # @example
      #   component :button, base_class: "btn"
      def component(name, base_class: nil)
        @component_name = name
        @component_base_class = base_class
      end

      # Register modifiers for this component
      # For components with component_name: registers in global registry
      # For sub-components without component_name: stores locally on class
      # The base_class uses the value from component() or auto-derives from component_name
      # If parent class has a different component_name with modifiers, they are merged
      #
      # @param modifiers [Hash] mapping of modifier symbols to CSS classes
      # @return [void]
      #
      # @example
      #   component :button, base_class: "btn"
      #   register_modifiers(
      #     primary: "btn-primary",
      #     large: "btn-lg"
      #   )
      def register_modifiers(modifiers)
        # If no component_name, store modifiers locally (for sub-components)
        unless @component_name
          @local_modifiers = modifiers.freeze
          return
        end

        base_class = @component_base_class || @component_name.to_s.tr("_", "-")

        # Merge with parent's modifiers if parent has a different component_name
        parent_component_name = superclass.respond_to?(:component_name) ? superclass.component_name : nil
        parent_modifiers = if parent_component_name && parent_component_name != @component_name
          PhlexyUI.modifiers_for(parent_component_name)
        else
          {}
        end

        merged_modifiers = parent_modifiers.merge(modifiers)
        PhlexyUI.register_component(@component_name, base_class: base_class, modifiers: merged_modifiers)
      end
    end

    private

    attr_reader :base_modifiers, :options, :as, :id

    # Get modifiers for this component from the registry
    # Falls back to local class modifiers for sub-components without registry
    #
    # @param component [Symbol, nil] optional component name to lookup
    # @return [Hash] the modifiers hash
    def modifiers(component: nil)
      component_name = component || self.class.component_name

      base_modifiers = if component_name && PhlexyUI.registered?(component_name)
        PhlexyUI.modifiers_for(component_name)
      elsif self.class.instance_variable_defined?(:@local_modifiers)
        self.class.instance_variable_get(:@local_modifiers) || {}
      else
        {}
      end

      {
        skeleton: :skeleton,
        **base_modifiers,
        **PhlexyUI.configuration.modifiers.for(component: self.class),
        **PhlexyUI.configuration.modifiers.for(component: nil)
      }
    end

    # Generate CSS classes for a component
    #
    # @param component [Symbol, nil] component name to lookup in registry (defaults to self.class.component_name)
    # @param component_html_class [String, Symbol, nil] base CSS class
    # @param base_modifiers [Array<Symbol>] modifier symbols to apply
    # @param options [Hash] component options
    # @param modifiers_map [Hash, nil] explicit modifiers map (overrides registry)
    # @return [String, nil] space-separated CSS classes or nil
    def generate_classes!(
      component: nil,
      component_html_class: nil,
      base_modifiers: [],
      options: {},
      modifiers_map: nil
    )
      # Default to using the class's component_name if not specified
      component ||= self.class.component_name

      # If component symbol provided, get from registry
      if component
        component_html_class ||= PhlexyUI.base_class_for(component)
        modifiers_map ||= modifiers(component: component)
      end

      # Fallback to instance modifiers if no map provided
      modifiers_map ||= modifiers

      ClassList.new(
        component: self,
        component_html_class: component_html_class,
        base_modifiers: base_modifiers,
        options: options,
        modifiers_map: modifiers_map
      ).to_a.then do |classes|
        classes.any? ? classes : nil
      end
    end

    def generate_attributes(base_modifiers, options, attributes_map)
      AttributeSet.new(base_modifiers, options, attributes_map).to_h
    end

    def render_as(*, as:, **, &)
      if as.is_a?(Symbol)
        render public_send(*, as:, **, &)
      else
        render as.new(*, **, &)
      end
    end
  end
end
