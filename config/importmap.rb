# frozen_string_literal: true

# Auto-pins the gem's bundled Stimulus controllers for importmap-rails consumers.
# Exposes `daisy_ui/controllers/daisy_dropdown_controller`. Register it in the
# host app (lazily recommended):
#
#   // app/javascript/controllers/index.js
#   import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
#   lazyLoadControllersFrom("daisy_ui/controllers", application)
pin_all_from DaisyUI::Engine.root.join("app/javascript/daisy_ui/controllers"),
  under: "daisy_ui/controllers",
  to: "daisy_ui/controllers"
