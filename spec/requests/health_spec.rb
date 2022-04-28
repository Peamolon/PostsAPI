require "rails_helper"

RSpec.describe "Health endpoint", type: :request do
  describe "GET /health" do
    before { get "/health" } #antes vamos a hacer una peticion al endpoint /health
    it "Should return http OK" do
        payload = JSON.parse(response.body)
        expect(payload).not_to be_empty
        expect(payload["api"]).to eq("OK")
    end

    it "Should return http status 200" do
      expect(response).to have_http_status(200)
    end
  end
end