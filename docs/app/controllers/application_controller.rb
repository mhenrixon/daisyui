# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp, web push, badges, import maps,
  # CSS nesting, and CSS :has (required by the zero-JS theme switcher).
  allow_browser versions: :modern

  protect_from_forgery with: :exception

  private

  # Render a Phlex page view. Docs::Shell IS the full HTML document (its own
  # <html>/<head>/<body> + the daisyUI drawer shell), so it must NOT be wrapped
  # in a Rails ERB application layout — `layout: false` prevents double <html>
  # nesting. phlex-rails still renders through a real view context, so the
  # reactive token signer, dom_id, csrf, and url helpers all work inside the
  # components on the page.
  def render_page(view)
    render view, layout: false
  end
end
