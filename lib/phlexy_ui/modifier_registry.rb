# frozen_string_literal: true

module PhlexyUI
  # Global registry for component modifiers.
  # Allows components to register their modifiers and makes them accessible
  # without inheritance. This enables:
  # - Extending components and inheriting their modifiers
  # - Using modifiers from any component without inheritance
  # - Component switching (e.g., Action using Button or Link modifiers)
  #
  # @example Registering a component
  #   PhlexyUI.register_component(
  #     :button,
  #     base_class: "btn",
  #     modifiers: {
  #       primary: "btn-primary",
  #       lg: "btn-lg"
  #     }
  #   )
  #
  # @example Getting modifiers
  #   PhlexyUI.modifiers_for(:button)
  #   # => { primary: "btn-primary", lg: "btn-lg" }
  #
  # @example Getting base class
  #   PhlexyUI.base_class_for(:button)
  #   # => "btn"
  class ModifierRegistry
    def initialize
      @registry = {}
    end

    # Register a component with its base class and modifiers
    #
    # @param component_name [Symbol] the component identifier (e.g., :button)
    # @param base_class [String] the base CSS class (e.g., "btn")
    # @param modifiers [Hash] mapping of modifier symbols to CSS classes
    # @return [void]
    def register(component_name, base_class:, modifiers:)
      @registry[component_name] = {
        base_class: base_class,
        modifiers: modifiers.freeze
      }.freeze
    end

    # Get modifiers for a component
    #
    # @param component_name [Symbol] the component identifier
    # @return [Hash] the modifiers hash, or empty hash if not found
    def modifiers_for(component_name)
      @registry.dig(component_name, :modifiers) || {}
    end

    # Get base class for a component
    #
    # @param component_name [Symbol] the component identifier
    # @return [String, nil] the base CSS class, or nil if not found
    def base_class_for(component_name)
      @registry.dig(component_name, :base_class)
    end

    # Check if a component is registered
    #
    # @param component_name [Symbol] the component identifier
    # @return [Boolean] true if the component is registered
    def registered?(component_name)
      @registry.key?(component_name)
    end

    # Get all registered component names
    #
    # @return [Array<Symbol>] array of registered component names
    def components
      @registry.keys
    end

    # Clear all registrations (useful for testing)
    #
    # @return [void]
    def clear!
      @registry.clear
    end

    # Unregister a specific component (useful for testing)
    #
    # @param component_name [Symbol] the component identifier to remove
    # @return [void]
    def unregister(component_name)
      @registry.delete(component_name)
    end
  end
end
