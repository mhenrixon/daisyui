# frozen_string_literal: true

require "spec_helper"

describe DaisyUI::Breadcrumbs do
  subject(:output) { render described_class.new }

  describe "rendering full breadcrumbs" do
    subject(:output) do
      render component.new
    end

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Breadcrumbs.new(
            class: "my-breadcrumb",
            data: { my: "breadcrumbs" }
          ) do |breadcrumbs|
            breadcrumbs.crumb class: "my-crumb", data: { my: "crumb" } do
              a do
                "Home"
              end
            end

            breadcrumbs.breadcrumb do
              a do
                "Documents"
              end
            end

            breadcrumbs.item do
              "Add Document"
            end
          end
        end
      end
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <div class="breadcrumbs my-breadcrumb" data-my="breadcrumbs">
          <ul>
            <li class="my-crumb" data-my="crumb"><a>Home</a></li>
            <li><a>Documents</a></li>
            <li>Add Document</li>
          </ul>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
