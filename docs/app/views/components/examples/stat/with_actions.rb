# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Stat
        class WithActions < Views::Components::Example
          include DaisyUI

          title "With custom colors and button"
          order 5

          def example
            Stat(class: "bg-base-100 border-base-300 border") do |s|
              s.item do
                s.title { "Account balance" }
                s.value { "$89,400" }
                s.actions do
                  Button(:xs, :success) { "Add funds" }
                end
              end
              s.item do
                s.title { "Current balance" }
                s.value { "$89,400" }
                s.actions do
                  Button(:xs) { "Withdrawal" }
                  Button(:xs) { "Deposit" }
                end
              end
            end
          end
        end
      end
    end
  end
end
