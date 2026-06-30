# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Chat
        class HeaderFooter < Views::Components::Example
          include DaisyUI

          title "Chat with header and footer"
          order 3

          def example
            Chat(:start) do |c|
              c.header do
                plain "Obi-Wan Kenobi"
                time(class: "text-xs opacity-50") { "2 hours ago" }
              end
              c.bubble { "You were the Chosen One!" }
              c.footer(class: "opacity-50") { "Seen" }
            end
            Chat(:start) do |c|
              c.header do
                plain "Obi-Wan Kenobi"
                time(class: "text-xs opacity-50") { "2 hours ago" }
              end
              c.bubble { "I loved you." }
              c.footer(class: "opacity-50") { "Delivered" }
            end
          end
        end
      end
    end
  end
end
