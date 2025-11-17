# frozen_string_literal: true

require "spec_helper"

describe DaisyUI::Skeleton do
  subject(:output) { render described_class.new }

  describe "rendering a full skeleton" do
    subject(:output) do
      render component.new
    end

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Skeleton.new(
            :neutral,
            as: :section,
            data: {
              my: :skeleton
            }
          ) do
            "Skeleton"
          end
        end
      end
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <section class="skeleton" data-my="skeleton">Skeleton</section>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
