# frozen_string_literal: true

module DaisyUI
  class Hover3d < Base
    self.component_class = "hover-3d"

    GRID_DIVS = 8

    def view_template(&)
      public_send(as, class: classes, **attributes) do
        yield if block_given?
        GRID_DIVS.times { div }
      end
    end
  end
end
