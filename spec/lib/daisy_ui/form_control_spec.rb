# frozen_string_literal: true

require "spec_helper"

describe DaisyUI::FormControl do
  subject(:output) { render described_class.new }

  describe "rendering a full form control" do
    subject(:output) do
      render component.new
    end

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::FormControl.new(as: :section) do
            span { "Username" }
            input(type: "text", placeholder: "Enter username")
          end
        end
      end
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <section class="form-control">
          <span>Username</span>
          <input type="text" placeholder="Enter username">
        </section>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
