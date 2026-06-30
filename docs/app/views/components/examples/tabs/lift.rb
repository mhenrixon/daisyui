# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Tabs
        class Lift < Views::Components::Example
          include DaisyUI

          title "Tabs lift with content"
          order 1

          def example
            Tabs(:lift, id: "tabs-lift-demo") do |t|
              t.tab("Tab 1", :active) do |tab|
                tab.content(class: "bg-base-100 border-base-300 p-6") { "Tab content 1" }
              end
              t.tab("Tab 2") do |tab|
                tab.content(class: "bg-base-100 border-base-300 p-6") { "Tab content 2" }
              end
              t.tab("Tab 3") do |tab|
                tab.content(class: "bg-base-100 border-base-300 p-6") { "Tab content 3" }
              end
            end
          end
        end
      end
    end
  end
end
