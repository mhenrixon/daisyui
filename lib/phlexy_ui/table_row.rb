# frozen_string_literal: true

module PhlexyUI
  class TableRow < Base
    self.component_class = nil

    def view_template(&)
      tr(class: classes, **attributes, &)
    end

    def head(*, **, &)
      th(*, **, &)
    end

    def column(*, **, &)
      td(*, **, &)
    end
    alias_method :cell, :column

    private

    register_modifiers(
      # "sm:table-row-hover"
      # "@sm:table-row-hover"
      # "md:table-row-hover"
      # "@md:table-row-hover"
      # "lg:table-row-hover"
      # "@lg:table-row-hover"
      hover: "hover",
      **COLOR_MODIFIERS
    )
  end
end
