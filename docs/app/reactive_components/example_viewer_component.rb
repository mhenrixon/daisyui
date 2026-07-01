# frozen_string_literal: true

# The reactive Preview/Source viewer behind every component-reference example.
#
# This is the docs site's flagship use of phlex-reactive: toggling between the
# live component and its Ruby source is a real server round-trip. The signed
# token carries only two scalars — the example class name and the active tab —
# so there is no client-trusted markup; the server rebuilds the example and
# re-renders the panel via `reply.morph` (preserving scroll/focus).
#
# `example` is the example class NAME (a String), validated against the
# ComponentDoc registry on every action so a forged class name can't be
# instantiated.
class ExampleViewerComponent < ReactiveBase

  TABS = %w[preview source].freeze

  reactive_state :example, :tab
  action :show_preview
  action :show_source

  def initialize(example:, tab: "preview")
    super()
    @example = example.to_s
    @tab = TABS.include?(tab.to_s) ? tab.to_s : "preview"
  end

  # Stable per-example id so the panel self-targets on toggle. Parameterized so
  # multiple example viewers can coexist on one page.
  def id = "example-viewer-#{@example.underscore.tr('/', '-')}"

  def show_preview
    @tab = "preview"
    reply.morph
  end

  def show_source
    @tab = "source"
    reply.morph
  end

  def view_template
    div(**reactive_root(class: "tabs tabs-lift", data: { testid: "example-viewer" })) do
      tab_trigger("Preview", "preview", :show_preview)
      tab_panel { preview }

      tab_trigger("Source", "source", :show_source)
      tab_panel { source }
    end
  end

  private

  # The example component instance, rebuilt from its signed class name. Returns
  # nil if the name isn't a registered example (defense against a forged token).
  def example_component
    klass = ComponentDoc.example_class_for(@example)
    klass&.new
  end

  # A daisyUI tab "button" that fires a reactive action. We render it as a label
  # wrapping a radio input (daisyUI tabs-lift markup) but drive the actual toggle
  # through phlex-reactive's `on`, so the active tab is server state, not just
  # CSS. `tab-active` reflects the current @tab.
  def tab_trigger(label, key, action)
    active = @tab == key
    classes = ["tab", ("tab-active" if active)].compact
    # `on` (a click trigger) already forces type="button"; don't pass it again or
    # mix concatenates it into "button button".
    button(**mix(
      on(action),
      role: "tab",
      class: classes,
      aria_selected: active.to_s,
      data: { testid: "tab-#{key}" }
    )) { label }
  end

  def tab_panel(&)
    div(role: "tabpanel", class: "tab-content border-base-300 bg-base-100 p-4", &)
  end

  def preview
    div(
      class: "flex flex-wrap items-center gap-3 rounded-box border border-base-300 p-6 min-h-32",
      style: Views::Components::PREVIEW_STYLE,
      data: { testid: "live-preview" }
    ) do
      cmp = example_component
      if cmp
        render cmp
      else
        span(class: "opacity-60 text-sm") { "Example unavailable" }
      end
    end
  end

  def source
    cmp = example_component
    if cmp
      DocsUI::Code(cmp.example_source, lexer: :ruby)
    else
      div(class: "opacity-60 text-sm") { "# source unavailable" }
    end
  end
end
