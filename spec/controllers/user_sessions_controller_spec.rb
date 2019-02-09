require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do
  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #terms" do
    it "returns http success" do
      get :terms
      expect(response).to have_http_status(:success)
    end
  end
end
