# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Accordion
        class Arrow < Views::Components::Example
          include DaisyUI

          title "Accordion with arrow icon"
          order 1

          def example
            Accordion(:arrow, name: "accordion-arrow", checked: true, class: "bg-base-100 border border-base-300") do |a|
              a.title(class: "font-semibold") { "How do I create an account?" }
              span(class: "text-sm") { %(Click the "Sign Up" button in the top right corner and follow the registration process.) }
            end
            Accordion(:arrow, name: "accordion-arrow", class: "bg-base-100 border border-base-300") do |a|
              a.title(class: "font-semibold") { "I forgot my password. What should I do?" }
              span(class: "text-sm") { %(Click on "Forgot Password" on the login page and follow the instructions sent to your email.) }
            end
            Accordion(:arrow, name: "accordion-arrow", class: "bg-base-100 border border-base-300") do |a|
              a.title(class: "font-semibold") { "How do I update my profile information?" }
              span(class: "text-sm") { %(Go to "My Account" settings and select "Edit Profile" to make changes.) }
            end
          end
        end
      end
    end
  end
end
