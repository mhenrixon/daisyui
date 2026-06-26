import { Controller } from "@hotwired/stimulus"

// daisy-dropdown — OPT-IN enhancement for the :popover Dropdown variant.
//
// The native Popover API already handles open/toggle, light-dismiss (outside
// click), Escape, and focus return — so this controller deliberately does NOT
// re-implement any of that. Its only jobs are:
//
//   1. A positioning fallback for browsers WITHOUT CSS anchor positioning
//      (Safari < 26, Firefox < 147). On modern browsers it does nothing and
//      fetches no extra JavaScript. The fallback lazily imports @floating-ui/dom,
//      which the HOST app must pin (see README) — if it is missing the menu still
//      opens (native popover), just unpositioned, and a console warning is logged.
//   2. Optional roving keyboard navigation over the menu's focusable items
//      (enable with data-daisy-dropdown-keyboard-value="true").
//
// State is driven entirely by the popover's native `toggle` event; there is no
// internal open flag, no document-level listeners, and no display toggling.
const OFFSET = 4

// Focusable, interactive menu items. Prefers explicit role="menuitem", but falls
// back to the links/buttons DaisyUI menus actually render (<li><a>…</a></li>), so
// keyboard nav works on stock markup without forcing roles onto caller content.
const ITEM_SELECTOR = '[role="menuitem"]:not([aria-disabled="true"]), a[href]:not([aria-disabled="true"]), button:not([disabled])'

export default class extends Controller {
  static targets = ["trigger", "menu"]
  static values = { keyboard: { type: Boolean, default: false } }

  connect() {
    this.menuEl = this.hasMenuTarget ? this.menuTarget : this.element.querySelector("[popover]")
    this.triggerEl = this.hasTriggerTarget ? this.triggerTarget : this.element.querySelector("[popovertarget]")
    if (!this.menuEl) return

    this.needsJsPositioning = !this.#supportsAnchorPositioning()
    this.onToggle = (event) => this.#handleToggle(event)
    this.menuEl.addEventListener("toggle", this.onToggle)
  }

  disconnect() {
    this.menuEl?.removeEventListener("toggle", this.onToggle)
    this.#teardownOpen()
  }

  #handleToggle(event) {
    if (event.newState === "open") this.#onOpen()
    else this.#onClose()
  }

  async #onOpen() {
    // The native Popover API does not mirror open state onto the invoker, so
    // sync aria-expanded ourselves for assistive tech.
    this.triggerEl?.setAttribute("aria-expanded", "true")
    if (this.needsJsPositioning) await this.#position()
    if (this.keyboardValue) this.#bindKeyboard()
  }

  #onClose() {
    this.triggerEl?.setAttribute("aria-expanded", "false")
    this.#teardownOpen()
    // Do NOT restore focus — the native popover already returns focus to the trigger.
  }

  #isOpen() {
    return this.menuEl?.matches(":popover-open") ?? false
  }

  #teardownOpen() {
    this.stopAutoUpdate?.()
    this.stopAutoUpdate = null
    if (this.keyHandler) {
      this.menuEl?.removeEventListener("keydown", this.keyHandler)
      this.keyHandler = null
    }
  }

  // --- positioning fallback (only when CSS anchor positioning is unavailable) ---

  async #position() {
    if (!this.triggerEl) return

    // Lazy + feature-gated, so modern browsers never fetch the positioning lib.
    // The host app is responsible for pinning @floating-ui/dom; if it is absent
    // we degrade gracefully (native popover still opens, just unpositioned).
    let floatingUi
    try {
      floatingUi = await import("@floating-ui/dom")
    } catch (error) {
      console.warn(
        "[daisy-dropdown] @floating-ui/dom is not available; the popover will open unpositioned. " +
          "Pin it in your import map to enable the legacy-browser positioning fallback.",
        error,
      )
      return
    }

    // A fast open→close during the dynamic import may have already closed us;
    // bail rather than position (and leak an autoUpdate on) a closed menu.
    if (!this.#isOpen()) return

    const { computePosition, autoUpdate, flip, shift, offset } = floatingUi

    this.menuEl.style.position = "fixed"
    this.menuEl.style.margin = "0"

    this.stopAutoUpdate = autoUpdate(this.triggerEl, this.menuEl, () => {
      computePosition(this.triggerEl, this.menuEl, {
        placement: this.#placement(),
        middleware: [offset(OFFSET), flip(), shift({ padding: 8 })],
      }).then(({ x, y }) => {
        Object.assign(this.menuEl.style, { left: `${x}px`, top: `${y}px` })
      })
    })
  }

  // Derive Floating UI placement from DaisyUI's dropdown-* classes on the menu.
  #placement() {
    const cl = this.menuEl.classList
    const side = cl.contains("dropdown-top")
      ? "top"
      : cl.contains("dropdown-left")
        ? "left"
        : cl.contains("dropdown-right")
          ? "right"
          : "bottom"
    const align = cl.contains("dropdown-end") ? "-end" : cl.contains("dropdown-center") ? "" : "-start"
    return (side === "left" || side === "right") ? side : `${side}${align}`
  }

  // --- optional roving keyboard navigation ---

  #bindKeyboard() {
    this.keyHandler = (event) => this.#onKeydown(event)
    this.menuEl.addEventListener("keydown", this.keyHandler)
    this.#items()[0]?.focus()
  }

  #onKeydown(event) {
    const items = this.#items()
    if (items.length === 0) return
    const index = items.indexOf(document.activeElement)

    switch (event.key) {
      case "ArrowDown":
        event.preventDefault()
        items[(index + 1 + items.length) % items.length].focus()
        break
      case "ArrowUp":
        event.preventDefault()
        items[(index - 1 + items.length) % items.length].focus()
        break
      case "Home":
        event.preventDefault()
        items[0].focus()
        break
      case "End":
        event.preventDefault()
        items[items.length - 1].focus()
        break
    }
  }

  #items() {
    return Array.from(this.menuEl.querySelectorAll(ITEM_SELECTOR))
  }

  #supportsAnchorPositioning() {
    return typeof CSS !== "undefined" && typeof CSS.supports === "function" && CSS.supports("anchor-name: --x")
  }
}
