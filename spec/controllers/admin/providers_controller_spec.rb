require 'rails_helper'

describe Admin::ProvidersController do
  context "an unauthenticated user" do
  end

  context "a standard user" do
  end

  context "an admin user" do
    let(:user) { create(:user, admin: true) }

    before do
      sign_in(user)
    end

    describe "GET #index" do
      it "renders the index template" do
        get :index
        expect(response).to render_template "index"
        expect(response.status).to eq(200)
      end
    end
  end
end

