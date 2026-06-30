# frozen_string_literal: true

require "rails_helper"

# A modern User-Agent so the `allow_browser versions: :modern` filter lets the
# request through (Rack::Test sends none by default).
MODERN_UA = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) " \
            "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0 Safari/537.36"

RSpec.describe "Pages", type: :request do
  let(:headers) { { "HTTP_USER_AGENT" => MODERN_UA } }

  describe "GET /" do
    it "renders the landing page with the live demos" do
      get root_path, headers: headers

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("DaisyUI Ruby")
      Demo.all.each { |demo| expect(response.body).to include(demo.title) }
    end
  end

  describe "GET /docs/:doc" do
    it "renders an authored guide page" do
      get doc_path("installation"), headers: headers

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Installation")
    end

    it "404s for an unknown slug" do
      get doc_path("nope"), headers: headers

      expect(response).to have_http_status(:not_found)
    end

    it "404s for a registered doc whose page class does not exist yet" do
      get doc_path("getting-started"), headers: headers

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET /components/:component" do
    it "renders an authored component reference page" do
      get component_path("button"), headers: headers

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Button")
      expect(response.body).to include('data-testid="component-panel"')
    end

    it "404s for an unknown component" do
      get component_path("nope"), headers: headers

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET /demos/:demo" do
    it "renders a reactive demo with its signed token and controller wiring" do
      get demo_path("counter"), headers: headers

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('data-controller="reactive"')
      expect(response.body).to include("data-reactive-token-value")
      expect(response.body).to include('id="counter"')
    end

    it "404s for an unknown demo" do
      get demo_path("nope"), headers: headers

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET /up" do
    it "returns 200 for the health check" do
      get rails_health_check_path, headers: headers

      expect(response).to have_http_status(:ok)
    end
  end
end
