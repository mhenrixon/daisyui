# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Footer
        class Basic < Views::Components::Example
          include DaisyUI

          title "Footer"
          order 1

          def example
            Footer(class: "sm:footer-horizontal bg-neutral text-neutral-content p-10") do |footer|
              nav do
                footer.title { "Services" }
                a(class: "link link-hover") { "Branding" }
                a(class: "link link-hover") { "Design" }
                a(class: "link link-hover") { "Marketing" }
                a(class: "link link-hover") { "Advertisement" }
              end
              nav do
                footer.title { "Company" }
                a(class: "link link-hover") { "About us" }
                a(class: "link link-hover") { "Contact" }
                a(class: "link link-hover") { "Jobs" }
                a(class: "link link-hover") { "Press kit" }
              end
              nav do
                footer.title { "Legal" }
                a(class: "link link-hover") { "Terms of use" }
                a(class: "link link-hover") { "Privacy policy" }
                a(class: "link link-hover") { "Cookie policy" }
              end
            end
          end
        end
      end
    end
  end
end
