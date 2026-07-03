# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include DocsKit::Controller

  # Only allow modern browsers supporting webp, web push, badges, import maps,
  # CSS nesting, and CSS :has (required by the zero-JS theme switcher).
  allow_browser versions: :modern

  protect_from_forgery with: :exception

  # render_page comes from DocsKit::Controller (included above): it renders the
  # Phlex view with layout: false (DocsUI::Shell IS the whole document) AND
  # serves the Markdown twin on a .md request. The site no longer defines its
  # own; the gem's version supersedes it.
end
