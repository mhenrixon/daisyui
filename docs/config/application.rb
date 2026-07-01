# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PhlexyUiDocs
  class Application < Rails::Application
    # Phlex views/components are autoloaded with namespaces in
    # config/initializers/phlex.rb (Views::, Components::) plus the top-level
    # app/reactive_components dir. No bare autoload_paths needed here.

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    # `rubocop` holds a custom cop (lib/rubocop/cop/...) loaded by RuboCop via
    # .rubocop.yml `require:`, NOT app code — ignore it so Rails doesn't try to
    # eager-load it (RuboCop::Cop::Base isn't available in the app runtime).
    config.autoload_lib(ignore: %w[assets tasks generators rubocop])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
