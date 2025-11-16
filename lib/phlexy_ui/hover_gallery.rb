# frozen_string_literal: true

module PhlexyUI
  # @component html class="hover-gallery"
  class HoverGallery < Base
    def initialize(*, as: :figure, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end
  end
end
