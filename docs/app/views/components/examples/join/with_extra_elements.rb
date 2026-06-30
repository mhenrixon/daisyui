# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Join
        class WithExtraElements < Views::Components::Example
          include DaisyUI

          title "With extra elements in the group"
          order 4

          def example
            Join do
              div do
                div do
                  input(class: "input join-item", placeholder: "Search")
                end
              end
              select(class: "select join-item") do
                option(disabled: true, selected: true) { "Filter" }
                option { "Sci-fi" }
                option { "Drama" }
                option { "Action" }
              end
              Indicator do |indicator|
                indicator.item(class: "badge badge-secondary") { "new" }
                Button(class: "join-item") { "Search" }
              end
            end
          end
        end
      end
    end
  end
end
