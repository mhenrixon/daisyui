# frozen_string_literal: true

module PhlexyUI
  # @component html class="hover-gallery"
  class HoverGallery < Base
    self.component_class = "hover-gallery"

    def initialize(*, as: :figure, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end
  end
end
