# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Chat
        class Basic < Views::Components::Example
          include DaisyUI

          title "Chat start and chat end"
          order 1

          def example
            Chat(:start) do |c|
              c.bubble do
                plain "It's over Anakin,"
                br
                plain "I have the high ground."
              end
            end
            Chat(:end) do |c|
              c.bubble { "You underestimate my power!" }
            end
          end
        end
      end
    end
  end
end
