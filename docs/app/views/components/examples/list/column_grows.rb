# frozen_string_literal: true

module Views
  module Components
    module Examples
      module List
        class ColumnGrows < Views::Components::Example
          include DaisyUI

          title "List with a growing column"
          order 2

          def example
            List(class: "bg-base-100 rounded-box shadow-md") do |l|
              li(class: "p-4 pb-2 text-xs opacity-60 tracking-wide") { "Most played songs this week" }
              l.row do
                div(class: "text-4xl font-thin opacity-30 tabular-nums") { "01" }
                div { img(class: "size-10 rounded-box", src: "https://img.daisyui.com/images/profile/demo/1@94.webp") }
                div(class: "list-col-grow") do
                  div { "Dio Lupa" }
                  div(class: "text-xs uppercase font-semibold opacity-60") { "Remaining Reason" }
                end
              end
              l.row do
                div(class: "text-4xl font-thin opacity-30 tabular-nums") { "02" }
                div { img(class: "size-10 rounded-box", src: "https://img.daisyui.com/images/profile/demo/4@94.webp") }
                div(class: "list-col-grow") do
                  div { "Ellie Beilish" }
                  div(class: "text-xs uppercase font-semibold opacity-60") { "Bears of a fever" }
                end
              end
              l.row do
                div(class: "text-4xl font-thin opacity-30 tabular-nums") { "03" }
                div { img(class: "size-10 rounded-box", src: "https://img.daisyui.com/images/profile/demo/3@94.webp") }
                div(class: "list-col-grow") do
                  div { "Sabrino Gardener" }
                  div(class: "text-xs uppercase font-semibold opacity-60") { "Cappuccino" }
                end
              end
            end
          end
        end
      end
    end
  end
end
