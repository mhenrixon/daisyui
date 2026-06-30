# frozen_string_literal: true

module Views
  module Docs
    module Pages
      # Template guide page. Each private method renders one Section interleaving
      # Code + Prose + Callout — copy this shape to author the rest of the docs.
      class Installation < Views::Docs::Page
        title "Installation"
        eyebrow "Guide"

        def lead
          "Add the gem, then render daisyUI components as plain Ruby with Phlex."
        end

        def content
          add_the_gem
          render_a_component
          tailwind_setup
        end

        private

        def add_the_gem
          render Views::Docs::Section.new("Add the gem") do
            render Views::Docs::Prose.new do
              p do
                plain "Add "
                code { "daisyui" }
                plain " to your Gemfile and install:"
              end
            end
            render Views::Code.new(<<~RUBY, lexer: :ruby, filename: "Gemfile")
              gem "daisyui"
            RUBY
            render Views::Code.new("bundle install", lexer: :shell)
          end
        end

        def render_a_component
          render Views::Docs::Section.new("Render a component") do
            render Views::Docs::Prose.new do
              p do
                plain "Components are Phlex classes under the "
                code { "DaisyUI" }
                plain " namespace. Include the module to use the short-form kit "
                plain "syntax, then call a component like a method:"
              end
            end
            render Views::Code.new(<<~RUBY, lexer: :ruby, filename: "app/views/home_view.rb")
              class HomeView < Phlex::HTML
                include DaisyUI

                def view_template
                  Button(:primary) { "Click me" }
                end
              end
            RUBY
            render Views::Docs::Callout.new(:tip, title: "Modifiers are symbols") do
              plain "Pass daisyUI modifiers as leading symbols — "
              plain "Button(:primary, :lg) renders btn btn-primary btn-lg."
            end
          end
        end

        def tailwind_setup
          render Views::Docs::Section.new("Tailwind & daisyUI CSS") do
            render Views::Docs::Prose.new do
              p do
                plain "The gem renders the class names; Tailwind + the daisyUI "
                plain "plugin produce the CSS. Load the daisyUI plugin in your "
                plain "Tailwind entry and include the gem's source so its "
                plain "render-time class names are detected:"
              end
            end
            render Views::Code.new(<<~CSS, lexer: :plaintext, filename: "application.tailwind.css")
              @import "tailwindcss";

              @plugin "daisyui" {
                themes: all;
              }

              /* Detect class names the gem generates at render time. */
              @source "../../../.bundle/gems/daisyui*/**/*.rb";
            CSS
            render Views::Docs::Callout.new(:warning, title: "Render-time classes") do
              plain "daisyUI components (like Drawer) emit some class names only "
              plain "at render time. Add an @source for the gem so Tailwind does "
              plain "not tree-shake their CSS."
            end
          end
        end
      end
    end
  end
end
