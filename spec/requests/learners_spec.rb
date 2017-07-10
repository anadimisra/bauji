require 'rails_helper'

RSpec.describe "Learners", type: :request do
  describe "GET /learners" do
    it "works! (now write some real specs)" do
      get learners_path
      expect(response).to have_http_status(200)
    end
  end
end
