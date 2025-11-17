# frozen_string_literal: true

module DaisyUI
  class Tabs < Base
    self.component_class = :tabs

    def initialize(*, id: nil, as: :div, **)
      super(*, id: nil, as:, **)
      @id = id
    end

    def view_template(&)
      public_send(as, role: :tablist, class: classes, **attributes, &)
    end

    def tab(*args, label: nil, **, &)
      # If first arg is a string, it's the label, rest are modifiers
      # Otherwise all args are modifiers
      label = args.shift if args.first.is_a?(String)

      render Tab.new(*args, label:, id:, **, &)
    end

    private

    # Override Base#attributes to exclude :id from the main tabs container.
    # The Tabs component uses :id internally to wire up the radio inputs
    # and their associated content panels - NOT for the main container.
    def attributes
      options
    end

    register_modifiers(
      # "sm:tabs-boxed"
      # "@sm:tabs-boxed"
      # "md:tabs-boxed"
      # "@md:tabs-boxed"
      # "lg:tabs-boxed"
      # "@lg:tabs-boxed"
      boxed: "tabs-boxed",
      # "sm:tabs-bordered"
      # "@sm:tabs-bordered"
      # "md:tabs-bordered"
      # "@md:tabs-bordered"
      # "lg:tabs-bordered"
      # "@lg:tabs-bordered"
      bordered: "tabs-bordered",
      # "sm:tabs-lifted"
      # "@sm:tabs-lifted"
      # "md:tabs-lifted"
      # "@md:tabs-lifted"
      # "lg:tabs-lifted"
      # "@lg:tabs-lifted"
      lifted: "tabs-lifted",
      # "sm:tabs-xs"
      # "@sm:tabs-xs"
      # "md:tabs-xs"
      # "@md:tabs-xs"
      # "lg:tabs-xs"
      # "@lg:tabs-xs"
      xs: "tabs-xs",
      # "sm:tabs-sm"
      # "@sm:tabs-sm"
      # "md:tabs-sm"
      # "@md:tabs-sm"
      # "lg:tabs-sm"
      # "@lg:tabs-sm"
      sm: "tabs-sm",
      # "sm:tabs-md"
      # "@sm:tabs-md"
      # "md:tabs-md"
      # "@md:tabs-md"
      # "lg:tabs-md"
      # "@lg:tabs-md"
      md: "tabs-md",
      # "sm:tabs-lg"
      # "@sm:tabs-lg"
      # "md:tabs-lg"
      # "@md:tabs-lg"
      # "lg:tabs-lg"
      # "@lg:tabs-lg"
      lg: "tabs-lg"
    )
  end
end
