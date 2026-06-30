# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Hover3d
        class CreditCard < Views::Components::Example
          include DaisyUI

          title "Holographic hover 3D credit card"
          order 2

          def example
            Hover3d(class: "my-12 mx-2 cursor-pointer") do
              Card(class: "w-96 bg-black text-white") do |c|
                c.body(class: "font-mono") do
                  div(class: "flex justify-between mb-10") do
                    div(class: "font-bold") { "BANK OF LATVERIA" }
                    div(class: "text-5xl opacity-10") { "❁" }
                  end
                  div(class: "text-lg mb-4 opacity-40") { "0210 8820 1150 0222" }
                  div(class: "flex justify-between") do
                    div do
                      div(class: "text-xs opacity-20") { "CARD HOLDER" }
                      div { "VICTOR VON D." }
                    end
                    div do
                      div(class: "text-xs opacity-20") { "EXPIRES" }
                      div { "29/08" }
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
