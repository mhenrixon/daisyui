# frozen_string_literal: true

module Views
  # NOTE: `::Components::Base` (top-level) is explicit — there is also a
  # `Views::Components` namespace (the component-reference example views), so a
  # bare `Components::Base` would resolve to `Views::Components::Base` and fail.
  class Base < ::Components::Base
    # The `Views::Base` is an abstract class for all your views.
    #
    # By default, it inherits from `::Components::Base`, but you can change that
    # to `Phlex::HTML` if you want to keep views and components independent.
    #
    # More caching options at https://www.phlex.fun/components/caching
    def cache_store = Rails.cache
  end
end
