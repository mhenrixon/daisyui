# frozen_string_literal: true

require "spec_helper"

describe DaisyUI::Calendar do
  describe "Cally calendar (default)" do
    subject(:output) { render described_class.new }

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <calendar-date class="cally"></calendar-date>
      HTML

      expect(output).to eq(expected_html)
    end

    context "with block content" do
      subject(:output) do
        render described_class.new, &:calendar_month
      end

      it "renders with content" do
        expected_html = html <<~HTML
          <calendar-date class="cally">
            <calendar-month></calendar-month>
          </calendar-date>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "Pikaday calendar" do
    subject(:output) { render described_class.new(type: :pikaday) }

    it "renders as input with pika-single class" do
      expected_html = html <<~HTML
        <input type="text" class="input pika-single">
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
        <calendar-date class="cally" data-foo="bar"></calendar-date>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
