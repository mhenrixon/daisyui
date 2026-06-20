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
  class Engine < ::Rails::Engine
    isolate_namespace DaisyUI

    JAVASCRIPT_PATH = root.join("app/javascript")

    initializer "daisy_ui.assets" do |app|
      app.config.assets.paths << JAVASCRIPT_PATH.to_s if app.config.respond_to?(:assets)
    end

    initializer "daisy_ui.importmap", before: "importmap" do |app|
      if app.config.respond_to?(:importmap)
        app.config.importmap.paths << root.join("config/importmap.rb")
        # Reload the gem's controller in development when it changes.
        app.config.importmap.cache_sweepers << JAVASCRIPT_PATH
      end
    end
  end
end
