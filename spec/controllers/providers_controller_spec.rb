require 'rails_helper'

describe ProvidersController, type: :controller do
  describe "GET #show" do
    it "renders the show template" do
      provider = create(:provider)
      get :show, id: provider.id
      expect(response).to render_template "show"
      expect(response.status).to eq(200)
    end
  end
end

