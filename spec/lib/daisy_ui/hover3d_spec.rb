# frozen_string_literal: true

require "spec_helper"

describe DaisyUI::Hover3d do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="hover-3d">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
      </div>
    HTML

    expect(output).to eq(expected_html)
  end

  describe "with content" do
    subject(:output) do
      render component.new
    end

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template
          render DaisyUI::Hover3d.new(class: "my-12 mx-2") do
            figure(class: "max-w-100 rounded-2xl") do
              img(src: "image.webp", alt: "3D card")
            end
          end
        end
      end
    end

    it "renders content before grid divs" do
      expected_html = html <<~HTML
        <div class="hover-3d my-12 mx-2">
          <figure class="max-w-100 rounded-2xl">
            <img src="image.webp" alt="3D card">
          </figure>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
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
        <div class="hover-3d" data-foo="bar">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :section) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <section class="hover-3d">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </section>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
