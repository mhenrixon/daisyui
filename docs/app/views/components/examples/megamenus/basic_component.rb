# frozen_string_literal: true

module Examples
  module Megamenus
    class BasicComponent < Base
      def title
        "Megamenu"
      end

      def example
        Megamenu id: "basic-menu", class: "p-2 border border-base-300", popover: true do |menu|
          menu.active_indicator

          button popovertarget: "basic-d1" do
            "One"
          end
          div id: "basic-d1", popover: true do
            div class: "p-4" do
              "Content for the first item"
            end
          end

          button popovertarget: "basic-d2" do
            "Two"
          end
          div id: "basic-d2", popover: true do
            div class: "p-4" do
              "Content for the second item"
            end
          end

          button popovertarget: "basic-d3" do
            "Three"
          end
          div id: "basic-d3", popover: true do
            div class: "p-4" do
              "Content for the third item"
            end
          end
        end
      end
    end
  end
end
