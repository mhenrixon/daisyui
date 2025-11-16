require_relative "lib/phlexy_ui/version"

Gem::Specification.new do |s|
  s.name = "daisyui"
  s.version = PhlexyUI::VERSION
  s.licenses = ["MIT"]
  s.summary = "DaisyUI is a Ruby UI component library for DaisyUI using Phlex"
  s.description = "DaisyUI is a Ruby UI component library for DaisyUI using Phlex"
  s.authors = ["David Alejandro Aguilar Ramos"]
  s.email = "mikael@zoolutions.llc"
  s.files = Dir["lib/**/*.rb"]
  s.homepage = "https://rubygems.org/gems/daisyui"
  s.metadata = {"source_code_uri" => "https://github.com/mhenrixon/daisyui"}

  s.required_ruby_version = ">= 3.2"

  s.add_dependency "phlex", ">= 2.0.0"
  s.add_dependency "zeitwerk", "~> 2.6"
end
