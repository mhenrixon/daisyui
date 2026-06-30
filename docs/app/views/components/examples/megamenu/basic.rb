# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Megamenu
        class Basic < Views::Components::Example
          include DaisyUI

          title "Megamenu"
          order 1

          def example
            Megamenu(class: "p-2 border border-base-300") do |m|
              m.active_indicator

              button(popovertarget: "mm-basic-1") { "One" }
              div(id: "mm-basic-1", popover: true) do
                div(class: "p-4") { "Content for the first item" }
              end

              button(popovertarget: "mm-basic-2") { "Two" }
              div(id: "mm-basic-2", popover: true) do
                div(class: "p-4") { "Content for the second item" }
              end

              button(popovertarget: "mm-basic-3") { "Three" }
              div(id: "mm-basic-3", popover: true) do
                div(class: "p-4") { "Content for the third item" }
              end
            end
          end
        end
      end
    end
  end
end
