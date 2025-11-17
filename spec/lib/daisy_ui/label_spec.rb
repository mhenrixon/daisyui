# frozen_string_literal: true

require "spec_helper"

describe DaisyUI::Label do
  describe "floating label" do
    subject(:output) { render component.new }

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Label.new(:floating) do
            input(type: "text", placeholder: "Email", class: "input input-md")
            span { "Your Email" }
          end
        end
      end
    end

    it "renders a floating label with input" do
      expected_html = html <<~HTML
        <label class="floating-label">
          <input type="text" placeholder="Email" class="input input-md">
          <span>Your Email</span>
        </label>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "input wrapper label" do
    subject(:output) { render component.new }

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Label.new(:input) do |label|
            label.text("https://")
            input(type: "text", placeholder: "URL")
          end
        end
      end
    end

    it "renders an input wrapper with label text" do
      expected_html = html <<~HTML
        <label class="input">
          <span class="label">https://</span>
          <input type="text" placeholder="URL">
        </label>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "input wrapper with label at the end" do
    subject(:output) { render component.new }

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Label.new(:input) do |label|
            input(type: "text", placeholder: "domain name")
            label.text(".com")
          end
        end
      end
    end

    it "renders an input wrapper with label text at the end" do
      expected_html = html <<~HTML
        <label class="input">
          <input type="text" placeholder="domain name">
          <span class="label">.com</span>
        </label>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "select wrapper label" do
    subject(:output) { render component.new }

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Label.new(:select) do |label|
            label.text("Type")
            select do
              option { "Personal" }
              option { "Business" }
            end
          end
        end
      end
    end

    it "renders a select wrapper with label text" do
      expected_html = html <<~HTML
        <label class="select">
          <span class="label">Type</span>
          <select>
            <option>Personal</option>
            <option>Business</option>
          </select>
        </label>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "floating label with different sizes" do
    subject(:output) { render component.new }

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Label.new(:floating) do
            input(type: "text", placeholder: "Small", class: "input input-sm")
            span { "Small" }
          end
          render DaisyUI::Label.new(:floating) do
            input(type: "text", placeholder: "Medium", class: "input input-md")
            span { "Medium" }
          end
          render DaisyUI::Label.new(:floating) do
            input(type: "text", placeholder: "Large", class: "input input-lg")
            span { "Large" }
          end
        end
      end
    end

    it "renders floating labels with different input sizes" do
      expected_html = html <<~HTML
        <label class="floating-label">
          <input type="text" placeholder="Small" class="input input-sm">
          <span>Small</span>
        </label>
        <label class="floating-label">
          <input type="text" placeholder="Medium" class="input input-md">
          <span>Medium</span>
        </label>
        <label class="floating-label">
          <input type="text" placeholder="Large" class="input input-lg">
          <span>Large</span>
        </label>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "text helper with block" do
    subject(:output) { render component.new }

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Label.new(:input) do |label|
            label.text { "Username" }
            input(type: "text", placeholder: "Enter username")
          end
        end
      end
    end

    it "renders label text using a block" do
      expected_html = html <<~HTML
        <label class="input">
          <span class="label">Username</span>
          <input type="text" placeholder="Enter username">
        </label>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "text helper with custom attributes" do
    subject(:output) { render component.new }

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Label.new(:input) do |label|
            label.text("https://", class: "custom-class", data: { test: "value" })
            input(type: "text", placeholder: "URL")
          end
        end
      end
    end

    it "renders label text with custom attributes" do
      expected_html = html <<~HTML
        <label class="input">
          <span class="label custom-class" data-test="value">https://</span>
          <input type="text" placeholder="URL">
        </label>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
