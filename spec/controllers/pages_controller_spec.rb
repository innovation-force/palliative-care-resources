require "rails_helper"

describe PagesController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template "index"
      expect(response.status).to eq(200)
    end
  end

  describe "GET #about" do
    it "renders the about template" do
      get :about
      expect(response).to render_template "about"
      expect(response.status).to eq(200)
    end
  end

  describe "GET #guide" do
    it "renders the guide template" do
      get :guide
      expect(response).to render_template "guide"
      expect(response.status).to eq(200)
    end
  end
end
