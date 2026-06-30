# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Chat
        class Colors < Views::Components::Example
          include DaisyUI

          title "Chat bubble with colors"
          order 2

          def example
            Chat(:start) { |c| c.bubble(:primary) { "What kind of nonsense is this" } }
            Chat(:start) { |c| c.bubble(:secondary) { "Put me on the Council and not make me a Master!??" } }
            Chat(:start) { |c| c.bubble(:accent) { "That's never been done in the history of the Jedi." } }
            Chat(:start) { |c| c.bubble(:neutral) { "It's insulting!" } }
            Chat(:end) { |c| c.bubble(:info) { "Calm down, Anakin." } }
            Chat(:end) { |c| c.bubble(:success) { "You have been given a great honor." } }
            Chat(:end) { |c| c.bubble(:warning) { "To be on the Council at your age." } }
            Chat(:end) { |c| c.bubble(:error) { "It's never happened before." } }
          end
        end
      end
    end
  end
end
