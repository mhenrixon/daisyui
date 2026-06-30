# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Table
        class PinRows < Views::Components::Example
          include DaisyUI

          title "Table with pinned rows"
          order 5

          GROUPS = {
            "A" => ["Ant-Man", "Aquaman", "Asterix", "The Atom", "The Avengers"],
            "B" => ["Batgirl", "Batman", "Batwoman", "Black Canary", "Black Panther"],
            "C" => ["Captain America", "Captain Marvel", "Catwoman", "Conan the Barbarian"],
            "D" => ["Daredevil", "The Defenders", "Doc Savage", "Doctor Strange"],
          }.freeze

          def example
            div(class: "h-96 overflow-x-auto") do
              Table(:pin_rows, class: "bg-base-200") do |t|
                GROUPS.each do |letter, names|
                  t.header do
                    tr { th { letter } }
                  end
                  t.body do
                    names.each do |name|
                      t.row do |r|
                        r.cell { name }
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
end
