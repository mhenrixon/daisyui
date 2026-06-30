# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Dropdown
        class Helper < Views::Components::Example
          include DaisyUI

          title "Helper dropdown"
          order 5

          def example
            Dropdown(:end) do |d|
              d.button(:circle, :ghost, :xs, class: "text-info") { "?" }
              d.content(class: "card card-sm bg-base-100 rounded-box z-1 w-64 shadow-sm") do
                Card do |c|
                  c.body do
                    c.title { "You needed more info?" }
                    p { "Here is a description!" }
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
