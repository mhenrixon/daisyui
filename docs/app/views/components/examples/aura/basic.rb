# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Aura
        class Basic < Views::Components::Example
          include DaisyUI

          title "Aura"
          order 1

          def example
            Aura do
              Card(class: "bg-base-100") do |c|
                c.body { p { "This card has aura" } }
              end
            end
          end
        end
      end
    end
  end
end
