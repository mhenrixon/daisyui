# frozen_string_literal: true

module PhlexHelpers
  class TestContext < Phlex::HTML
    def view_template(&)
      div(&)
    end
  end

  def phlex_context(&)
    render TestContext.new, &
  end
end

RSpec.configure do |config|
  config.include PhlexHelpers
  config.include DaisyUI
end
