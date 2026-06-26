# frozen_string_literal: true

module Examples
  module Megamenus
    class SizesComponent < Base
      def title
        "Megamenu sizes"
      end

      def example
        div class: "flex flex-col gap-4 w-full" do
          Megamenu :xs, id: "size-xs-menu", class: "p-2 border border-base-300", popover: true do |menu|
            menu.active_indicator

            button popovertarget: "size-xs-1" do
              "One"
            end
            div id: "size-xs-1", popover: true do
              div class: "p-4" do
                "Content for the first item"
              end
            end

            button popovertarget: "size-xs-2" do
              "Two"
            end
            div id: "size-xs-2", popover: true do
              div class: "p-4" do
                "Content for the second item"
              end
            end

            button popovertarget: "size-xs-3" do
              "Three"
            end
            div id: "size-xs-3", popover: true do
              div class: "p-4" do
                "Content for the third item"
              end
            end
          end

          Megamenu :sm, id: "size-sm-menu", class: "p-2 border border-base-300", popover: true do |menu|
            menu.active_indicator

            button popovertarget: "size-sm-1" do
              "One"
            end
            div id: "size-sm-1", popover: true do
              div class: "p-4" do
                "Content for the first item"
              end
            end

            button popovertarget: "size-sm-2" do
              "Two"
            end
            div id: "size-sm-2", popover: true do
              div class: "p-4" do
                "Content for the second item"
              end
            end

            button popovertarget: "size-sm-3" do
              "Three"
            end
            div id: "size-sm-3", popover: true do
              div class: "p-4" do
                "Content for the third item"
              end
            end
          end

          Megamenu :md, id: "size-md-menu", class: "p-2 border border-base-300", popover: true do |menu|
            menu.active_indicator

            button popovertarget: "size-md-1" do
              "One"
            end
            div id: "size-md-1", popover: true do
              div class: "p-4" do
                "Content for the first item"
              end
            end

            button popovertarget: "size-md-2" do
              "Two"
            end
            div id: "size-md-2", popover: true do
              div class: "p-4" do
                "Content for the second item"
              end
            end

            button popovertarget: "size-md-3" do
              "Three"
            end
            div id: "size-md-3", popover: true do
              div class: "p-4" do
                "Content for the third item"
              end
            end
          end

          Megamenu :lg, id: "size-lg-menu", class: "p-2 border border-base-300", popover: true do |menu|
            menu.active_indicator

            button popovertarget: "size-lg-1" do
              "One"
            end
            div id: "size-lg-1", popover: true do
              div class: "p-4" do
                "Content for the first item"
              end
            end

            button popovertarget: "size-lg-2" do
              "Two"
            end
            div id: "size-lg-2", popover: true do
              div class: "p-4" do
                "Content for the second item"
              end
            end

            button popovertarget: "size-lg-3" do
              "Three"
            end
            div id: "size-lg-3", popover: true do
              div class: "p-4" do
                "Content for the third item"
              end
            end
          end

          Megamenu :xl, id: "size-xl-menu", class: "p-2 border border-base-300", popover: true do |menu|
            menu.active_indicator

            button popovertarget: "size-xl-1" do
              "One"
            end
            div id: "size-xl-1", popover: true do
              div class: "p-4" do
                "Content for the first item"
              end
            end

            button popovertarget: "size-xl-2" do
              "Two"
            end
            div id: "size-xl-2", popover: true do
              div class: "p-4" do
                "Content for the second item"
              end
            end

            button popovertarget: "size-xl-3" do
              "Three"
            end
            div id: "size-xl-3", popover: true do
              div class: "p-4" do
                "Content for the third item"
              end
            end
          end
        end
      end
    end
  end
end
