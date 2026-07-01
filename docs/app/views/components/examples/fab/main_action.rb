# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Fab
        class MainAction < Views::Components::Example
          include DaisyUI

          title "FAB with main action button"
          order 3

          def example
            div(class: "fab-preview-container w-full") do
              Fab do |f|
                div(tabindex: 0, role: :button, class: "btn btn-lg btn-circle btn-primary") { "F" }
                f.main_action do
                  plain "Main Action "
                  Button(:lg, :circle, :secondary) { "M" }
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
