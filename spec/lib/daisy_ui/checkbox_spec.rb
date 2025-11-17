# frozen_string_literal: true

require "spec_helper"

describe DaisyUI::Checkbox do
  subject(:output) { render described_class.new }

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:primary, responsive: { viewport => :lg })
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <input type="checkbox" class="checkbox checkbox-primary #{viewport}:checkbox-lg">
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:primary, responsive: { viewport => %i[lg secondary] })
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <input type="checkbox" class="checkbox checkbox-primary #{viewport}:checkbox-lg #{viewport}:checkbox-secondary">
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "conditional attributes" do
    subject(:output) do
      render component.new
    end

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Checkbox.new(:checked, disabled: true)
          render DaisyUI::Checkbox.new(:disabled, checked: true)
          render DaisyUI::Checkbox.new(checked: true, disabled: true)
          render DaisyUI::Checkbox.new(checked: false, disabled: true)
          render DaisyUI::Checkbox.new(checked: true, disabled: false)
          render DaisyUI::Checkbox.new(checked: false, disabled: false)
        end
      end
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <input type="checkbox" class="checkbox" checked disabled>
        <input type="checkbox" class="checkbox" checked disabled>
        <input type="checkbox" class="checkbox" checked disabled>
        <input type="checkbox" class="checkbox" disabled>
        <input type="checkbox" class="checkbox" checked>
        <input type="checkbox" class="checkbox">
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "rendering a full checkbox" do
    subject(:output) do
      render component.new
    end

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Checkbox.new(
            :primary,
            :checked,
            :disabled,
            lg: true
          )
        end
      end
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <input type="checkbox" class="checkbox checkbox-primary checkbox-lg" checked disabled>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
