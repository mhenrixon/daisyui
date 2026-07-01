# frozen_string_literal: true

module Components
  class Base < Phlex::HTML
    # Include any helpers you want to be available across all components.
    include Phlex::Rails::Helpers::Routes
    # The docs-kit Phlex kit — render the shared chrome in the short kit form
    # (DocsUI::Code(...)) instead of render DocsUI::Code.new(...). Enforced by
    # DocsKit/RenderComponentPreferred.
    include DocsUI

    if Rails.env.development?
      def before_template
        comment { "Before #{self.class.name}" }
        super
      end
    end
  end
end
