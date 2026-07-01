# frozen_string_literal: true

# Base for the docs' reactive components that also render docs-kit chrome
# (DocsUI::Code, ...). Bundles the reactive mixins + the DocsUI kit so those
# components can use the short kit form.
#
# Reparenting is token-safe: the signed identity carries `klass.name` (the class
# name string), not the ancestry, so ExampleViewerComponent stays
# "ExampleViewerComponent" in the token.
class ReactiveBase < Phlex::HTML
  include Phlex::Reactive::Streamable
  include Phlex::Reactive::Component
  include DocsUI
end
