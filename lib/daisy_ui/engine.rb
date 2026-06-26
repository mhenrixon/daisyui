# frozen_string_literal: true

module DaisyUI
  # Optional Rails integration. Loaded only when Rails::Engine is defined (see
  # lib/daisy_ui.rb), so the gem stays a plain Phlex library outside Rails.
  #
  # It exposes the gem's bundled JavaScript (the opt-in `daisy-dropdown`
  # Stimulus controller) to the host app:
  #   * appends the JS dir to importmap-rails' paths and auto-pins it, so
  #     consumers get `daisy_ui/controllers/daisy_dropdown_controller` with no
  #     manual pin;
  #   * appends the JS dir to the asset load path so Propshaft/Sprockets serve
  #     the file.
  #
  # The controller is opt-in at the markup level (`Dropdown(:popover, stimulus:
  # true)`), so apps that never opt in ship no extra behavior.
  # Asset-only engine: no isolate_namespace, since it exposes no routes, models,
  # or helpers — only static JavaScript — and namespacing would risk surprises in
  # the host app for no benefit.
  class Engine < ::Rails::Engine
    JAVASCRIPT_PATH = root.join("app/javascript")

    initializer "daisy_ui.assets" do |app|
      app.config.assets.paths << JAVASCRIPT_PATH.to_s if app.config.respond_to?(:assets)
    end

    initializer "daisy_ui.importmap", before: "importmap" do |app|
      next unless app.config.respond_to?(:importmap)

      importmap = app.config.importmap
      importmap.paths << root.join("config/importmap.rb") if importmap.respond_to?(:paths)
      # Reload the gem's controller in development when it changes.
      importmap.cache_sweepers << JAVASCRIPT_PATH if importmap.respond_to?(:cache_sweepers)
    end
  end
end
