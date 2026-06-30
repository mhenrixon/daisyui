# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Table
        class Hover < Views::Components::Example
          include DaisyUI

          title "Table with a row that highlights on hover"
          order 3

          def example
            div(class: "overflow-x-auto") do
              Table do |t|
                t.header do
                  tr do
                    th
                    th { "Name" }
                    th { "Job" }
                    th { "Favorite Color" }
                  end
                end
                t.body do
                  t.row do |r|
                    r.head { "1" }
                    r.cell { "Cy Ganderton" }
                    r.cell { "Quality Control Specialist" }
                    r.cell { "Blue" }
                  end
                  t.row(:hover) do |r|
                    r.head { "2" }
                    r.cell { "Hart Hagerty" }
                    r.cell { "Desktop Support Technician" }
                    r.cell { "Purple" }
                  end
                  t.row do |r|
                    r.head { "3" }
                    r.cell { "Brice Swyre" }
                    r.cell { "Tax Accountant" }
                    r.cell { "Red" }
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
