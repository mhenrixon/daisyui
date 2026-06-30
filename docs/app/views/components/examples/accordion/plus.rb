# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Accordion
        class Plus < Views::Components::Example
          include DaisyUI

          title "Accordion with plus/minus icon"
          order 2

          def example
            Accordion(:plus, name: "accordion-plus", checked: true, class: "bg-base-100 border border-base-300") do |a|
              a.title(class: "font-semibold") { "How do I create an account?" }
              p(class: "text-sm") { %(Click the "Sign Up" button in the top right corner and follow the registration process.) }
            end
            Accordion(:plus, name: "accordion-plus", class: "bg-base-100 border border-base-300") do |a|
              a.title(class: "font-semibold") { "I forgot my password. What should I do?" }
              p(class: "text-sm") { %(Click on "Forgot Password" on the login page and follow the instructions sent to your email.) }
            end
            Accordion(:plus, name: "accordion-plus", class: "bg-base-100 border border-base-300") do |a|
              a.title(class: "font-semibold") { "How do I update my profile information?" }
              p(class: "text-sm") { %(Go to "My Account" settings and select "Edit Profile" to make changes.) }
            end
          end
        end
      end
    end
  end
end
