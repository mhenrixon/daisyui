# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Table
        class Zebra < Views::Components::Example
          include DaisyUI

          title "Zebra"
          order 2

          ROWS = [
            ["1", "Cy Ganderton", "Quality Control Specialist", "Blue"],
            ["2", "Hart Hagerty", "Desktop Support Technician", "Purple"],
            ["3", "Brice Swyre", "Tax Accountant", "Red"],
          ].freeze

          def example
            div(class: "overflow-x-auto") do
              Table(:zebra) do |t|
                t.header do
                  tr do
                    th
                    th { "Name" }
                    th { "Job" }
                    th { "Favorite Color" }
                  end
                end
                t.body do
                  ROWS.each do |num, name, job, color|
                    t.row do |r|
                      r.head { num }
                      r.cell { name }
                      r.cell { job }
                      r.cell { color }
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
end
