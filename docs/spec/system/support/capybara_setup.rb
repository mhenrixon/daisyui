# frozen_string_literal: true

require "capybara/rails"
require "capybara/rspec"

require_relative "playwright_setup"

# Configure Capybara for system specs
Capybara.server = :puma, { Silent: true }

# Set default driver
Capybara.register_driver :rack_test do |app|
  Capybara::RackTest::Driver.new(app, headers: { "HTTP_USER_AGENT" => "Capybara" })
end

capybara_host = "127.0.0.1"
capybara_port = 3001 + ENV["TEST_ENV_NUMBER"].to_i

Capybara.app_host     = "http://#{capybara_host}"
Capybara.asset_host   = Capybara.app_host
Capybara.server_host  = capybara_host
Capybara.server_port  = capybara_port
Capybara.default_host = "http://#{capybara_host}"

Capybara.configure do |c|
  c.default_max_wait_time = 5
  c.default_driver        = :daisyui_playwright
  c.javascript_driver     = :daisyui_playwright
  c.save_path             = "tmp/capybara"
  c.always_include_port   = true
end

# Also run at several viewport widths so responsive layout regressions are
# caught. Pick with CAPYBARA_SCREEN (default desktop); specs asserting
# desktop-only layout are tagged :desktop_only and skipped on small screens.
SCREEN_SIZES = {
  "mobile" => [390, 844],
  "tablet" => [820, 1180],
  "desktop" => [1920, 1080],
}.freeze
CAPYBARA_SCREEN = ENV.fetch("CAPYBARA_SCREEN", "desktop")
CAPYBARA_SCREEN_SIZE = SCREEN_SIZES.fetch(CAPYBARA_SCREEN) do
  raise "CAPYBARA_SCREEN must be one of #{SCREEN_SIZES.keys.join(', ')} (got #{CAPYBARA_SCREEN.inspect})"
end

RSpec.configure do |config|
  config.filter_run_excluding(:desktop_only) unless CAPYBARA_SCREEN == "desktop"

  config.prepend_before(:each, type: :system) do
    driven_by(:daisyui_playwright, screen_size: CAPYBARA_SCREEN_SIZE, options: { js_errors: true })
  end

  config.around(:each, type: :system) do |ex|
    was_host = Rails.application.default_url_options[:host]
    was_port = Rails.application.default_url_options[:port]
    Rails.application.default_url_options[:host] = Capybara.server_host
    Rails.application.default_url_options[:port] = Capybara.server_port

    ex.run

    Rails.application.default_url_options[:host] = was_host
    Rails.application.default_url_options[:port] = was_port
  end

  # Save page HTML on failure for debugging
  config.after(:each, type: :system) do |example|
    if example.exception
      # Save HTML to file
      html_path = "tmp/capybara/failures_#{example.id.tr('/', '_').tr(':', '_')}.html"
      File.write(html_path, page.html)
      puts "\n[HTML saved to: #{html_path}]"
      puts "\n[Page URL: #{page.current_url}]"
      puts "\n[Page HTML snippet - first 2000 chars]:"
      puts page.html[0..2000]
    end
  end
end
