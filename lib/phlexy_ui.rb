require "phlex"
require "zeitwerk"
require_relative "phlexy_ui/version"
require_relative "phlexy_ui/updated_at"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  "phlexy_ui" => "PhlexyUI"
)
loader.ignore("#{__dir__}/phlexy_ui/updated_at.rb")
loader.setup # ready!
loader.load_file("#{__dir__}/phlexy_ui/base.rb")

module PhlexyUI
  extend Configurable
  extend Phlex::Kit

  class << self
    # Get the global modifier registry
    #
    # @return [ModifierRegistry] the registry instance
    def registry
      @registry ||= ModifierRegistry.new
    end

    # Register a component with its modifiers
    #
    # @param component_name [Symbol] the component identifier (e.g., :button)
    # @param base_class [String] the base CSS class (e.g., "btn")
    # @param modifiers [Hash] mapping of modifier symbols to CSS classes
    # @return [void]
    #
    # @example
    #   PhlexyUI.register_component(
    #     :button,
    #     base_class: "btn",
    #     modifiers: { primary: "btn-primary" }
    #   )
    def register_component(component_name, base_class:, modifiers:)
      registry.register(component_name, base_class: base_class, modifiers: modifiers)
    end

    # Get modifiers for a component
    #
    # @param component_name [Symbol] the component identifier
    # @return [Hash] the modifiers hash
    def modifiers_for(component_name)
      registry.modifiers_for(component_name)
    end

    # Get base class for a component
    #
    # @param component_name [Symbol] the component identifier
    # @return [String, nil] the base CSS class
    def base_class_for(component_name)
      registry.base_class_for(component_name)
    end

    # Check if a component is registered
    #
    # @param component_name [Symbol] the component identifier
    # @return [Boolean] true if registered
    def registered?(component_name)
      registry.registered?(component_name)
    end
  end
end
