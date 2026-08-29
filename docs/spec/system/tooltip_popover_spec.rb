# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Popover tooltip", type: :system do
  it "opens in the top layer and remains inside the viewport" do
    visit component_path("tooltip")

    trigger = find_button("Left edge")
    trigger.hover

    expect(page).to have_css("#left_edge_tooltip:popover-open")
    expect(trigger["aria-describedby"]).to eq("left_edge_tooltip")

    bounds = page.evaluate_script(<<~JS)
      (() => {
        const rect = document.querySelector("#left_edge_tooltip").getBoundingClientRect()
        return { left: rect.left, right: rect.right, viewport: window.innerWidth }
      })()
    JS

    expect(bounds.fetch("left")).to be >= 8
    expect(bounds.fetch("right")).to be <= bounds.fetch("viewport") - 8

    arrow = page.evaluate_script(<<~JS)
      (() => {
        const host = document.querySelector('[data-controller~="daisy-tooltip"]')
        const tooltip = document.querySelector("#left_edge_tooltip")
        const arrow = tooltip.querySelector('[data-daisy-tooltip-target~="arrow"]')
        const arrowStyle = getComputedStyle(arrow)
        const arrowBounds = arrow.getBoundingClientRect()

        return {
          stockArrowDisplay: getComputedStyle(host, "::after").display,
          width: arrowBounds.width,
          height: arrowBounds.height,
          background: arrowStyle.backgroundColor,
          tooltipBackground: getComputedStyle(tooltip).backgroundColor,
          borders: [
            arrowStyle.borderTopWidth,
            arrowStyle.borderRightWidth,
            arrowStyle.borderBottomWidth,
            arrowStyle.borderLeftWidth,
          ],
        }
      })()
    JS

    expect(arrow.fetch("stockArrowDisplay")).to eq("none")
    expect(arrow.fetch("width")).to be > 0
    expect(arrow.fetch("height")).to be > 0
    expect(arrow.fetch("background")).to eq(arrow.fetch("tooltipBackground"))
    expect(arrow.fetch("borders")).to all(eq("0px"))

    find("h1", text: "Tooltip").hover
    expect(page).to have_no_css("#left_edge_tooltip:popover-open")
  end
end
