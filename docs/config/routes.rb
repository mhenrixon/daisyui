# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsIcons::Engine, at: "/rails_icons"

  # Reveal health status on /up that returns 200 if the app boots with no
  # exceptions, otherwise 500. Used by load balancers and uptime monitors.
  get "up" => "rails/health#show", as: :rails_health_check

  # Dynamic PWA files from app/views/pwa/*.
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # The landing page.
  root "landings#show"

  # Component reference pages — the slug resolves to a ComponentDoc in the
  # in-memory registry, rendered through one shared Views::Components::Show page.
  # Each example uses the reactive ExampleViewer (Preview/Source toggle). The
  # phlex-reactive engine mounts POST /reactive/actions itself — do NOT add it
  # here, and keep no catch-all route below that could shadow it.
  get "components/:component" => "components#show", as: :component

  # Reference docs (guides) — the slug resolves to a Doc whose hand-authored
  # Phlex page class renders it.
  get "docs/:doc" => "docs#show", as: :doc
end
