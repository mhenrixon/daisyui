# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Components", type: :system do
  describe "Homepage" do
    it "loads the homepage" do
      visit root_path
      expect(page).to have_content("DaisyUI")
    end
  end

  describe "Button component" do
    it "displays button examples" do
      visit examples_path(component: "button")
      wait_for_turbo

      expect(page).to have_css(".btn")
      expect(page).to have_content("Button")
    end

    it "shows button variants" do
      visit examples_path(component: "button")
      wait_for_turbo

      expect(page).to have_css(".btn-primary")
      expect(page).to have_css(".btn-secondary")
    end
  end

  describe "Card component" do
    it "displays card examples" do
      visit examples_path(component: "card")
      wait_for_turbo

      expect(page).to have_css(".card")
    end
  end

  describe "Modal component" do
    it "displays modal examples" do
      visit examples_path(component: "modal")
      wait_for_turbo

      # Modals are hidden by default until opened, so check including hidden elements
      expect(page).to have_css(".modal", visible: :all)
    end
  end

  describe "Collapse component" do
    it "displays collapse examples" do
      visit examples_path(component: "collapse")
      wait_for_turbo

      expect(page).to have_css(".collapse")
    end

    it "can toggle collapse" do
      visit examples_path(component: "collapse")
      wait_for_turbo

      collapse = find(".collapse", match: :first)
      collapse_title = collapse.find(".collapse-title")

      # Click to expand
      collapse_title.click
      wait_for_animation

      # The collapse content should now be visible
      expect(collapse).to have_css(".collapse-content")
    end
  end

  describe "Dropdown component" do
    it "displays dropdown examples" do
      visit examples_path(component: "dropdown")
      wait_for_turbo

      expect(page).to have_css(".dropdown")
    end
  end

  describe "Menu component" do
    it "displays menu examples" do
      visit examples_path(component: "menu")
      wait_for_turbo

      expect(page).to have_css(".menu")
    end
  end

  describe "Navbar component" do
    it "displays navbar examples" do
      visit examples_path(component: "navbar")
      wait_for_turbo

      expect(page).to have_css(".navbar")
    end
  end

  describe "Alert component" do
    it "displays alert examples" do
      visit examples_path(component: "alert")
      wait_for_turbo

      expect(page).to have_css(".alert")
    end
  end

  describe "Badge component" do
    it "displays badge examples" do
      visit examples_path(component: "badge")
      wait_for_turbo

      expect(page).to have_css(".badge")
    end
  end

  describe "Avatar component" do
    it "displays avatar examples" do
      visit examples_path(component: "avatar")
      wait_for_turbo

      expect(page).to have_css(".avatar")
    end
  end

  describe "Table component" do
    it "displays table examples" do
      visit examples_path(component: "table")
      wait_for_turbo

      expect(page).to have_css(".table")
    end
  end

  describe "Tooltip component" do
    it "displays tooltip examples" do
      visit examples_path(component: "tooltip")
      wait_for_turbo

      expect(page).to have_css(".tooltip")
    end
  end

  describe "Loading component" do
    it "displays loading examples" do
      visit examples_path(component: "loading")
      wait_for_turbo

      expect(page).to have_css(".loading")
    end
  end

  describe "Skeleton component" do
    it "displays skeleton examples" do
      visit examples_path(component: "skeleton")
      wait_for_turbo

      expect(page).to have_css(".skeleton")
    end
  end

  describe "Checkbox component" do
    it "displays checkbox examples" do
      visit examples_path(component: "checkbox")
      wait_for_turbo

      expect(page).to have_css(".checkbox")
    end
  end

  describe "Breadcrumbs component" do
    it "displays breadcrumbs examples" do
      visit examples_path(component: "breadcrumbs")
      wait_for_turbo

      expect(page).to have_css(".breadcrumbs")
    end
  end

  describe "Link component" do
    it "displays link examples" do
      visit examples_path(component: "link")
      wait_for_turbo

      expect(page).to have_css(".link")
    end
  end

  describe "Radial Progress component" do
    it "displays radial progress examples" do
      visit examples_path(component: "radial_progress")
      wait_for_turbo

      expect(page).to have_css(".radial-progress")
    end
  end

  describe "Accordion component" do
    it "displays accordion examples" do
      visit examples_path(component: "accordion")
      wait_for_turbo

      expect(page).to have_css(".collapse")
    end
  end

  describe "Divider component" do
    it "displays divider examples" do
      visit examples_path(component: "divider")
      wait_for_turbo

      expect(page).to have_css(".divider")
    end
  end

  describe "Drawer component" do
    it "displays drawer examples" do
      visit examples_path(component: "drawer")
      wait_for_turbo

      expect(page).to have_css(".drawer")
    end
  end

  describe "Footer component" do
    it "displays footer examples" do
      visit examples_path(component: "footer")
      wait_for_turbo

      expect(page).to have_css(".footer")
    end
  end

  describe "Hero component" do
    it "displays hero examples" do
      visit examples_path(component: "hero")
      wait_for_turbo

      expect(page).to have_css(".hero")
    end
  end

  describe "Steps component" do
    it "displays steps examples" do
      visit examples_path(component: "steps")
      wait_for_turbo

      expect(page).to have_css(".steps")
    end
  end

  describe "Tab component" do
    it "displays tab examples" do
      visit examples_path(component: "tab")
      wait_for_turbo

      expect(page).to have_css(".tabs")
    end
  end

  describe "Input component" do
    it "displays input examples" do
      visit examples_path(component: "input")
      wait_for_turbo

      expect(page).to have_css(".input")
    end
  end

  describe "Select component" do
    it "displays select examples" do
      visit examples_path(component: "select")
      wait_for_turbo

      expect(page).to have_css(".select")
    end
  end

  describe "Textarea component" do
    it "displays textarea examples" do
      visit examples_path(component: "textarea")
      wait_for_turbo

      expect(page).to have_css(".textarea")
    end
  end

  describe "Toggle component" do
    it "displays toggle examples" do
      visit examples_path(component: "toggle")
      wait_for_turbo

      expect(page).to have_css(".toggle")
    end
  end

  describe "Range component" do
    it "displays range examples" do
      visit examples_path(component: "range")
      wait_for_turbo

      expect(page).to have_css(".range")
    end
  end

  describe "Radio component" do
    it "displays radio examples" do
      visit examples_path(component: "radio")
      wait_for_turbo

      expect(page).to have_css(".radio")
    end
  end

  describe "Rating component" do
    it "displays rating examples" do
      visit examples_path(component: "rating")
      wait_for_turbo

      expect(page).to have_css(".rating")
    end
  end

  describe "Progress component" do
    it "displays progress examples" do
      visit examples_path(component: "progress")
      wait_for_turbo

      expect(page).to have_css(".progress")
    end
  end

  describe "Toast component" do
    it "displays toast examples" do
      visit examples_path(component: "toast")
      wait_for_turbo

      expect(page).to have_css(".toast")
    end
  end

  describe "Stat component" do
    it "displays stat examples" do
      visit examples_path(component: "stat")
      wait_for_turbo

      expect(page).to have_css(".stats")
    end
  end

  describe "Countdown component" do
    it "displays countdown examples" do
      visit examples_path(component: "countdown")
      wait_for_turbo

      expect(page).to have_css(".countdown")
    end
  end

  describe "Kbd component" do
    it "displays kbd examples" do
      visit examples_path(component: "kbd")
      wait_for_turbo

      expect(page).to have_css(".kbd")
    end
  end

  describe "Timeline component" do
    it "displays timeline examples" do
      visit examples_path(component: "timeline")
      wait_for_turbo

      expect(page).to have_css(".timeline")
    end
  end

  describe "Swap component" do
    it "displays swap examples" do
      visit examples_path(component: "swap")
      wait_for_turbo

      expect(page).to have_css(".swap")
    end
  end

  describe "Carousel component" do
    it "displays carousel examples" do
      visit examples_path(component: "carousel")
      wait_for_turbo

      expect(page).to have_css(".carousel")
    end
  end

  describe "Chat component" do
    it "displays chat examples" do
      visit examples_path(component: "chat")
      wait_for_turbo

      expect(page).to have_css(".chat")
    end
  end

  describe "Stack component" do
    it "displays stack examples" do
      visit examples_path(component: "stack")
      wait_for_turbo

      expect(page).to have_css(".stack")
    end
  end

  describe "Indicator component" do
    it "displays indicator examples" do
      visit examples_path(component: "indicator")
      wait_for_turbo

      expect(page).to have_css(".indicator")
    end
  end

  describe "Join component" do
    it "displays join examples" do
      visit examples_path(component: "join")
      wait_for_turbo

      expect(page).to have_css(".join")
    end
  end

  describe "Mask component" do
    it "displays mask examples" do
      visit examples_path(component: "mask")
      wait_for_turbo

      expect(page).to have_css(".mask")
    end
  end

  describe "Diff component" do
    it "displays diff examples" do
      visit examples_path(component: "diff")
      wait_for_turbo

      expect(page).to have_css(".diff")
    end
  end

  describe "Pagination component" do
    it "displays pagination examples" do
      visit examples_path(component: "pagination")
      wait_for_turbo

      expect(page).to have_css(".join")
    end
  end

  describe "File Input component" do
    it "displays file input examples" do
      visit examples_path(component: "file_input")
      wait_for_turbo

      expect(page).to have_css(".file-input")
    end
  end

  describe "Mockup Browser component" do
    it "displays mockup browser examples" do
      visit examples_path(component: "mockup_browser")
      wait_for_turbo

      expect(page).to have_css(".mockup-browser")
    end
  end

  describe "Mockup Code component" do
    it "displays mockup code examples" do
      visit examples_path(component: "mockup_code")
      wait_for_turbo

      expect(page).to have_css(".mockup-code")
    end
  end

  describe "Mockup Phone component" do
    it "displays mockup phone examples" do
      visit examples_path(component: "mockup_phone")
      wait_for_turbo

      expect(page).to have_css(".mockup-phone")
    end
  end

  describe "Mockup Window component" do
    it "displays mockup window examples" do
      visit examples_path(component: "mockup_window")
      wait_for_turbo

      expect(page).to have_css(".mockup-window")
    end
  end

  describe "Dock component" do
    it "displays dock examples" do
      visit examples_path(component: "dock")
      wait_for_turbo

      expect(page).to have_css(".dock")
    end
  end

  describe "Fab component" do
    it "displays fab examples" do
      visit examples_path(component: "fab")
      wait_for_turbo

      # FAB uses specific positioning classes, not a .fab class
      expect(page).to have_css(".fixed.bottom-4.right-4, .btn-circle, [class*='fab']", wait: 2)
    end
  end

  describe "Filter component" do
    it "displays filter examples" do
      visit examples_path(component: "filter")
      wait_for_turbo

      expect(page).to have_css(".filter")
    end
  end

  describe "Fieldset component" do
    it "displays fieldset examples" do
      visit examples_path(component: "fieldset")
      wait_for_turbo

      expect(page).to have_css(".fieldset")
    end
  end

  describe "Form Control component" do
    it "displays form control examples" do
      visit examples_path(component: "form_control")
      wait_for_turbo

      expect(page).to have_css(".form-control")
    end
  end

  describe "Label component" do
    it "displays label examples" do
      visit examples_path(component: "label")
      wait_for_turbo

      expect(page).to have_css(".label")
    end
  end

  describe "Calendar component" do
    it "displays calendar examples" do
      visit examples_path(component: "calendar")
      wait_for_turbo

      # Calendar uses cally web component or pikaday
      expect(page).to have_css("calendar-date, .cally, .pika-single, input[type='text']", wait: 2)
    end
  end

  describe "Theme Controller component" do
    it "displays theme controller examples" do
      visit examples_path(component: "theme_controller")
      wait_for_turbo

      # Theme controller typically uses toggle or select elements
      expect(page).to have_css(".theme-controller, [class*='theme'], .toggle, .select", wait: 2)
    end
  end

  describe "Validator component" do
    it "displays validator examples" do
      visit examples_path(component: "validator")
      wait_for_turbo

      expect(page).to have_css(".validator")
    end
  end

  describe "Status component" do
    it "displays status examples" do
      visit examples_path(component: "status")
      wait_for_turbo

      expect(page).to have_css(".status")
    end
  end

  describe "Hover Gallery component" do
    it "displays hover gallery examples" do
      visit examples_path(component: "hover_gallery")
      wait_for_turbo

      # Hover gallery might have various implementations
      expect(page).to have_css("[class*='gallery'], .grid", wait: 2)
    end
  end

  describe "List component" do
    it "displays list examples" do
      visit examples_path(component: "list")
      wait_for_turbo

      expect(page).to have_css(".list")
    end
  end

  describe "Aura component" do
    it "displays aura examples" do
      visit examples_path(component: "aura")
      wait_for_turbo

      expect(page).to have_css(".aura")
    end
  end

  describe "Megamenu component" do
    it "displays megamenu examples" do
      visit examples_path(component: "megamenu")
      wait_for_turbo

      # Megamenu uses popover, so it may be hidden until opened
      expect(page).to have_css(".megamenu", visible: :all)
    end
  end

  describe "OTP component" do
    it "displays otp examples" do
      visit examples_path(component: "otp")
      wait_for_turbo

      expect(page).to have_css(".otp")
    end
  end
end
