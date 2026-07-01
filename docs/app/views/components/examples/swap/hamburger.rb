# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Swap
        class Hamburger < Views::Components::Example
          include DaisyUI

          title "Hamburger button"
          order 4

          def example
            DaisyUI::Swap.new(:rotate, class: "btn btn-circle") do |s|
              input(type: :checkbox)
              s.on do
                svg(class: "fill-current", xmlns: "http://www.w3.org/2000/svg", width: "32", height: "32", viewBox: "0 0 512 512") do |s|
                  s.polygon(points: "400 145.49 366.51 112 256 222.51 145.49 112 112 145.49 222.51 256 112 366.51 145.49 400 256 289.49 366.51 400 400 366.51 289.49 256 400 145.49")
                end
              end
              s.off do
                svg(class: "fill-current", xmlns: "http://www.w3.org/2000/svg", width: "32", height: "32", viewBox: "0 0 512 512") do |s|
                  s.path(d: "M64,384H448V341.33H64Zm0-106.67H448V234.67H64ZM64,128v42.67H448V128Z")
                end
              end
            end
          end
        end
      end
    end
  end
end
