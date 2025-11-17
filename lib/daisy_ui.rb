# frozen_string_literal: true

require "phlex"
require "zeitwerk"
require_relative "daisy_ui/version"
require_relative "daisy_ui/updated_at"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  "daisy_ui" => "DaisyUI"
)
loader.ignore("#{__dir__}/daisy_ui/updated_at.rb")
loader.setup # ready!
loader.load_file("#{__dir__}/daisy_ui/base.rb")

module DaisyUI
  extend Configurable
  extend Phlex::Kit
end
