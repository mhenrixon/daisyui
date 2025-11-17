# frozen_string_literal: true

require_relative "lib/daisy_ui/version"

Gem::Specification.new do |s|
  s.name = "daisyui"
  s.version = DaisyUI::VERSION
  s.licenses = ["MIT"]
  s.summary = "Ruby UI components for DaisyUI built with Phlex"
  s.description = "DaisyUI is a comprehensive Ruby UI component library that brings DaisyUI's beautiful Tailwind CSS components to your Ruby applications using Phlex. Build modern, accessible web interfaces with ease."
  s.authors = ["Mikael Henriksson"]
  s.email = "mikael@zoolutions.llc"
  s.files = Dir["lib/**/*.rb"]
  s.homepage = "https://github.com/mhenrixon/daisy_ui"
  s.metadata = {
    "homepage_uri" => "https://github.com/mhenrixon/daisy_ui",
    "source_code_uri" => "https://github.com/mhenrixon/daisy_ui",
    "changelog_uri" => "https://github.com/mhenrixon/daisy_ui/blob/main/CHANGELOG.md",
    "bug_tracker_uri" => "https://github.com/mhenrixon/daisy_ui/issues",
    "rubygems_mfa_required" => "true"
  }

  s.required_ruby_version = ">= 3.2"

  s.add_dependency "phlex", "~> 2.0", ">= 2.0.0"
  s.add_dependency "zeitwerk", "~> 2.6"
end
