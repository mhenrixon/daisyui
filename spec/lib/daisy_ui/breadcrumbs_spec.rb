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

  describe "rendering breadcrumbs with add method" do
    subject(:output) do
      render component.new
    end

    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render DaisyUI::Breadcrumbs.new(class: "text-sm") do |bc|
            bc.add(href: "/admin") { "Dashboard" }
            bc.add(href: "/admin/transactions") { "Transactions" }
            bc.add(class: "opacity-80") { "Details" }
          end
        end
      end
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <div class="breadcrumbs text-sm">
          <ul>
            <li><a href="/admin">Dashboard</a></li>
            <li><a href="/admin/transactions">Transactions</a></li>
            <li class="opacity-80">Details</li>
          </ul>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
