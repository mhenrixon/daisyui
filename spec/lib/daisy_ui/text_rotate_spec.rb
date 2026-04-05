# frozen_string_literal: true

require "spec_helper"

describe DaisyUI::TextRotate do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <span class="text-rotate"><span></span></span>
    HTML

    expect(output).to eq(expected_html)
  end

  describe "with items" do
    subject(:output) do
      render component.new
    end

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template
          render DaisyUI::TextRotate.new do
            span { "ONE" }
            span { "TWO" }
            span { "THREE" }
          end
        end
      end
    end

    it "renders items inside wrapper span" do
      expected_html = html <<~HTML
        <span class="text-rotate">
          <span>
            <span>ONE</span>
            <span>TWO</span>
            <span>THREE</span>
          </span>
        </span>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "data" do
    subject(:output) do
      render described_class.new(data: { foo: "bar" })
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <span class="text-rotate" data-foo="bar"><span></span></span>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :div) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <div class="text-rotate"><span></span></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
