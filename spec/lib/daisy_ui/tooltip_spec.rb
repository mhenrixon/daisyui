# frozen_string_literal: true

require "spec_helper"

describe DaisyUI::Tooltip do
  subject(:output) { render described_class.new }

  describe "modifiers" do
    {
      open: "tooltip-open",
      top: "tooltip-top",
      neutral: "tooltip-neutral",
      bottom: "tooltip-bottom",
      left: "tooltip-left",
      right: "tooltip-right",
      primary: "tooltip-primary",
      secondary: "tooltip-secondary",
      accent: "tooltip-accent",
      info: "tooltip-info",
      success: "tooltip-success",
      warning: "tooltip-warning",
      error: "tooltip-error",
      start: "tooltip-start",
      center: "tooltip-center",
      end: "tooltip-end"
    }.each do |condition, css|
      context "when given :#{condition} condition" do
        subject(:output) { render described_class.new(condition, tip: "tip") }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="tooltip #{css}" data-tip="tip"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) { render described_class.new(responsive: { viewport => true }, tip: "tip") }

        it "renders the component class responsively" do
          expected_html = html <<~HTML
            <div class="#{viewport}:tooltip" data-tip="tip"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given an :#{viewport} responsive option with a boolean and a modifier" do
        subject(:output) { render described_class.new(responsive: { viewport => [true, :top] }, tip: "tip") }

        it "renders the component class and the modifier class responsively" do
          expected_html = html <<~HTML
            <div class="#{viewport}:tooltip #{viewport}:tooltip-top" data-tip="tip"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "rendering via Kit" do
    subject(:output) do
      Tooltip tip: "A tooltip"
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <div class="tooltip" data-tip="A tooltip"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :a, tip: "A tooltip") }

    it "renders the tooltip as the given tag" do
      expected_html = html <<~HTML
        <a class="tooltip" data-tip="A tooltip"></a>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "rendering a full tooltip" do
    subject(:output) do
      render component.new
    end

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Tooltip.new(:top, tip: "My tooltip")
        end
      end
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <div class="tooltip tooltip-top" data-tip="My tooltip"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "rendering a tooltip with content sub-component" do
    subject(:output) do
      render component.new
    end

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Tooltip.new(:top, tip: "My tooltip") do |tooltip|
            tooltip.content class: "bg-primary text-primary-content" do
              plain "Custom content"
            end
          end
        end
      end
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <div class="tooltip tooltip-top" data-tip="My tooltip">
          <div class="tooltip-content bg-primary text-primary-content">Custom content</div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
