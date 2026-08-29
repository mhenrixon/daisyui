# frozen_string_literal: true

require "spec_helper"

describe DaisyUI::Tooltip do
  subject(:output) { render described_class.new }

  it "renders without data-tip when tip is omitted" do
    expected_html = html <<~HTML
      <div class="tooltip"></div>
    HTML

    expect(output).to eq(expected_html)
  end

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

  describe "rendering a content-only tooltip without tip" do
    subject(:output) do
      render component.new
    end

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Tooltip.new(:open, :primary) do |tooltip|
            tooltip.content do
              plain "Rich content"
            end
            plain "Hover me"
          end
        end
      end
    end

    it "renders without data-tip attribute" do
      expect(output).to include('class="tooltip tooltip-open tooltip-primary"')
      expect(output).to include('<div class="tooltip-content">Rich content</div>')
      expect(output).not_to include("data-tip")
    end
  end

  describe "popover mode" do
    def popover_component(*modifiers, **options)
      Class.new(Phlex::HTML) do
        define_method(:view_template) do
          render DaisyUI::Tooltip.new(:popover, *modifiers, tip: "Helpful details", **options) do
            button { "More information" }
          end
        end
      end
    end

    it "renders the tooltip content in the browser top layer" do
      output = render popover_component(:top, popover_id: "help_tip").new

      expect(output).to include('data-controller="daisy-tooltip"')
      expect(output).to include('data-daisy-tooltip-placement-value="top"')
      expect(output).to include('id="help_tip"')
      expect(output).to include('popover="manual"')
      expect(output).to include('role="tooltip"')
      expect(output).to include('data-daisy-tooltip-target="content"')
      expect(output).to include('data-daisy-tooltip-target="arrow"')
      expect(output).to include("Helpful details")
      expect(output).not_to include("data-tip")
    end

    it "preserves caller-supplied controllers" do
      output = render popover_component(data: { controller: "analytics" }).new

      expect(output).to include('data-controller="analytics daisy-tooltip"')
    end

    it "derives placement from directional modifiers" do
      %i[top bottom left right].each do |placement|
        output = render popover_component(placement).new

        expect(output).to include(%(data-daisy-tooltip-placement-value="#{placement}"))
      end
    end

    it "uses rich content instead of the tip string when content is rendered" do
      component = Class.new(Phlex::HTML) do
        def view_template
          render DaisyUI::Tooltip.new(:popover, tip: "Fallback") do |tooltip|
            tooltip.content(class: "max-w-48") { strong { "Rich details" } }
            button { "More information" }
          end
        end
      end

      output = render component.new

      expect(output).to include('class="tooltip-content max-w-48"')
      expect(output).to include("Rich details")
      expect(output).not_to include("Fallback")
    end

    it "uses a caller-supplied controller identifier" do
      output = render popover_component(stimulus: "floating-tooltip").new

      expect(output).to include('data-controller="floating-tooltip"')
      expect(output).to include('data-floating-tooltip-placement-value="top"')
      expect(output).to include('data-floating-tooltip-target="content"')
      expect(output).to include('data-floating-tooltip-target="arrow"')
      expect(output).not_to include("daisy-tooltip")
    end

    it "does not change classic tooltip markup" do
      component = Class.new(Phlex::HTML) do
        def view_template
          render DaisyUI::Tooltip.new(:top, tip: "Classic") { button { "Hover" } }
        end
      end

      output = render component.new

      expect(output).to include('class="tooltip tooltip-top"')
      expect(output).to include('data-tip="Classic"')
      expect(output).not_to include("popover")
      expect(output).not_to include("daisy-tooltip")
    end
  end
end
