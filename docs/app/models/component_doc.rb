# frozen_string_literal: true

# Registry of the component reference pages — one entry per documented daisyUI
# gem component. Each maps a URL slug to its title and sidebar category. The
# example classes themselves live under `Views::Components::Examples::<Slug>::*`
# and are discovered at render time, so adding an example is just dropping a new
# class in that namespace.
#
# Only components that have at least one example class are linked in the sidebar
# and the landing page, so there are never dead links while the reference is
# being authored.
class ComponentDoc
  REGISTRY = [
    # Actions
    { slug: "button", title: "Button", category: "Actions" },
    { slug: "dropdown", title: "Dropdown", category: "Actions" },
    { slug: "fab", title: "FAB", category: "Actions" },
    { slug: "filter", title: "Filter", category: "Actions" },
    { slug: "modal", title: "Modal", category: "Actions" },
    { slug: "swap", title: "Swap", category: "Actions" },
    { slug: "theme-controller", title: "Theme Controller", category: "Actions" },

    # Data display
    { slug: "accordion", title: "Accordion", category: "Data display" },
    { slug: "aura", title: "Aura", category: "Data display" },
    { slug: "avatar", title: "Avatar", category: "Data display" },
    { slug: "badge", title: "Badge", category: "Data display" },
    { slug: "card", title: "Card", category: "Data display" },
    { slug: "carousel", title: "Carousel", category: "Data display" },
    { slug: "chat", title: "Chat", category: "Data display" },
    { slug: "collapse", title: "Collapse", category: "Data display" },
    { slug: "countdown", title: "Countdown", category: "Data display" },
    { slug: "diff", title: "Diff", category: "Data display" },
    { slug: "hover-gallery", title: "Hover Gallery", category: "Data display" },
    { slug: "kbd", title: "Kbd", category: "Data display" },
    { slug: "list", title: "List", category: "Data display" },
    { slug: "stat", title: "Stat", category: "Data display" },
    { slug: "table", title: "Table", category: "Data display" },
    { slug: "timeline", title: "Timeline", category: "Data display" },

    # Data input
    { slug: "calendar", title: "Calendar", category: "Data input" },
    { slug: "checkbox", title: "Checkbox", category: "Data input" },
    { slug: "fieldset", title: "Fieldset", category: "Data input" },
    { slug: "file-input", title: "File Input", category: "Data input" },
    { slug: "form-control", title: "Form Control", category: "Data input" },
    { slug: "input", title: "Input", category: "Data input" },
    { slug: "label", title: "Label", category: "Data input" },
    { slug: "otp", title: "OTP", category: "Data input" },
    { slug: "radio", title: "Radio", category: "Data input" },
    { slug: "range", title: "Range", category: "Data input" },
    { slug: "rating", title: "Rating", category: "Data input" },
    { slug: "select", title: "Select", category: "Data input" },
    { slug: "textarea", title: "Textarea", category: "Data input" },
    { slug: "toggle", title: "Toggle", category: "Data input" },
    { slug: "validator", title: "Validator", category: "Data input" },

    # Feedback
    { slug: "alert", title: "Alert", category: "Feedback" },
    { slug: "loading", title: "Loading", category: "Feedback" },
    { slug: "progress", title: "Progress", category: "Feedback" },
    { slug: "radial-progress", title: "Radial Progress", category: "Feedback" },
    { slug: "skeleton", title: "Skeleton", category: "Feedback" },
    { slug: "status", title: "Status", category: "Feedback" },
    { slug: "toast", title: "Toast", category: "Feedback" },
    { slug: "tooltip", title: "Tooltip", category: "Feedback" },

    # Layout
    { slug: "divider", title: "Divider", category: "Layout" },
    { slug: "drawer", title: "Drawer", category: "Layout" },
    { slug: "footer", title: "Footer", category: "Layout" },
    { slug: "hero", title: "Hero", category: "Layout" },
    { slug: "indicator", title: "Indicator", category: "Layout" },
    { slug: "join", title: "Join", category: "Layout" },
    { slug: "mask", title: "Mask", category: "Layout" },
    { slug: "stack", title: "Stack", category: "Layout" },

    # Mockup
    { slug: "mockup-browser", title: "Mockup Browser", category: "Mockup" },
    { slug: "mockup-code", title: "Mockup Code", category: "Mockup" },
    { slug: "mockup-phone", title: "Mockup Phone", category: "Mockup" },
    { slug: "mockup-window", title: "Mockup Window", category: "Mockup" },

    # Navigation
    { slug: "breadcrumbs", title: "Breadcrumbs", category: "Navigation" },
    { slug: "dock", title: "Dock", category: "Navigation" },
    { slug: "link", title: "Link", category: "Navigation" },
    { slug: "megamenu", title: "Megamenu", category: "Navigation" },
    { slug: "menu", title: "Menu", category: "Navigation" },
    { slug: "navbar", title: "Navbar", category: "Navigation" },
    { slug: "pagination", title: "Pagination", category: "Navigation" },
    { slug: "steps", title: "Steps", category: "Navigation" },
    { slug: "tabs", title: "Tabs", category: "Navigation" },

    # Special effects
    { slug: "avatar-group", title: "Avatar Group", category: "Data display" },
    { slug: "hover-3d", title: "Hover 3D", category: "Data display" },
    { slug: "text-rotate", title: "Text Rotate", category: "Data display" },
  ].freeze

  attr_reader :slug, :title, :category

  def initialize(slug:, title:, category:)
    @slug = slug
    @title = title
    @category = category
  end

  def self.all
    REGISTRY.map { new(**it) }
  end

  def self.from_slug(slug)
    all.find { it.slug == slug }
  end

  def self.grouped
    all.group_by(&:category)
  end

  # The example namespace module for this component (e.g.
  # `Views::Components::Examples::Button`), or nil if not yet authored.
  def self.namespace_for(slug)
    "Views::Components::Examples::#{slug.to_s.tr('-', '_').camelize}".safe_constantize
  end

  # Securely resolve an example class NAME (from a signed reactive token) to its
  # class — but ONLY if it lives in a registered component's example namespace.
  # A forged name outside that namespace returns nil.
  def self.example_class_for(name)
    klass = name.to_s.safe_constantize
    return nil unless klass.is_a?(Class)
    return nil unless klass < Views::Components::Example
    return nil unless klass.name.start_with?("Views::Components::Examples::")

    klass
  end

  # The example namespace module for this component instance.
  def namespace
    self.class.namespace_for(slug)
  end

  # All example classes for this component, ordered. Empty if the component has
  # no example namespace yet.
  def examples
    ns = namespace
    return [] unless ns

    ns.constants
      .map { |c| ns.const_get(c) }
      .select { |k| k.is_a?(Class) && k < Views::Components::Example }
      .sort_by { |k| [k.order, k.name] }
  end

  def example_class
    examples.first
  end
end
