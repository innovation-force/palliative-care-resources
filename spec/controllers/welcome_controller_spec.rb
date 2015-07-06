require 'rails_helper'

describe WelcomeController do
  context "GET #index" do
    it "returns sucessfully" do
      get :index
      assert_response :success
    end
  end
end
