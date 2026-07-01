# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Fab
        class Close < Views::Components::Example
          include DaisyUI

          title "FAB with a close button"
          order 4

          def example
            div(class: "fab-preview-container w-full") do
              Fab do |f|
                div(tabindex: 0, role: :button, class: "btn btn-lg btn-circle btn-info") { "F" }
                f.close do
                  plain "Close "
                  span(class: "btn btn-circle btn-lg btn-error") { "✕" }
                end
                div do
                  plain "Label A "
                  Button(:lg, :circle) { "A" }
                end
                div do
                  plain "Label B "
                  Button(:lg, :circle) { "B" }
                end
                div do
                  plain "Label C "
                  Button(:lg, :circle) { "C" }
                end
              end
            end
          end
        end
      end
    end
  end
end
