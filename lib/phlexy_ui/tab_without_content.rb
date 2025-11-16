# frozen_string_literal: true

module PhlexyUI
  # @private
  class TabWithoutContent < Base
    def view_template(&)
      div role: :tab, class: classes, &
    end

    private

    attr_reader :title

    register_modifiers(
      # "sm:tab-active"
      # "@sm:tab-active"
      # "md:tab-active"
      # "@md:tab-active"
      # "lg:tab-active"
      # "@lg:tab-active"
      active: "tab-active",
      # "sm:tab-disabled"
      # "@sm:tab-disabled"
      # "md:tab-disabled"
      # "@md:tab-disabled"
      # "lg:tab-disabled"
      # "@lg:tab-disabled"
      disabled: "tab-disabled"
    )
  end
end
