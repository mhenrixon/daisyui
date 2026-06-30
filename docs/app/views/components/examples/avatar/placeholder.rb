# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Avatar
        class Placeholder < Views::Components::Example
          include DaisyUI

          title "Avatar placeholder"
          order 4

          def example
            Avatar(:placeholder) do
              div(class: "bg-neutral text-neutral-content w-24 rounded-full") do
                span(class: "text-3xl") { "D" }
              end
            end
            Avatar(:online, :placeholder) do
              div(class: "bg-neutral text-neutral-content w-16 rounded-full") do
                span(class: "text-xl") { "AI" }
              end
            end
            Avatar(:placeholder) do
              div(class: "bg-neutral text-neutral-content w-12 rounded-full") do
                span { "SY" }
              end
            end
          end
        end
      end
    end
  end
end
