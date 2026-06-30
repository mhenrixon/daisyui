# frozen_string_literal: true

module Views
  module Components
    module Examples
      module MockupPhone
        class Iphone < Views::Components::Example
          include DaisyUI

          title "iPhone mockup"
          order 1

          def example
            MockupPhone do |mockup|
              mockup.camera
              mockup.display(class: "text-white grid place-content-center bg-neutral-900") do
                "It's Glowtime."
              end
            end
          end
        end
      end
    end
  end
end
