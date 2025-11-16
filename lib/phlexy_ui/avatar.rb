# frozen_string_literal: true

module PhlexyUI
  class Avatar < Base
    self.component_class = :avatar

    def initialize(*, as: :div, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    private

    register_modifiers(
      # "sm:online"
      # "@sm:online"
      # "md:online"
      # "@md:online"
      # "lg:online"
      # "@lg:online"
      online: "online",
      # "sm:offline"
      # "@sm:offline"
      # "md:offline"
      # "@md:offline"
      # "lg:offline"
      # "@lg:offline"
      offline: "offline",
      # "sm:placeholder"
      # "@sm:placeholder"
      # "md:placeholder"
      # "@md:placeholder"
      # "lg:placeholder"
      # "@lg:placeholder"
      placeholder: "placeholder"
    )
  end
end
