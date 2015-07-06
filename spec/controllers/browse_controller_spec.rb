require 'rails_helper'

describe BrowseController do
  context "GET #category" do
    it "should get category" do
      get :category
      assert_response :success
    end
  end

  context "GET #concern" do
    it "should get concern" do
      get :concern
      assert_response :success
    end
  end

  context "GET #service" do
    it "should get service" do
      get :service
      assert_response :success
    end
  end

  context "GET #servprovider" do
    it "should get servprovider" do
      get :servprovider
      assert_response :success
    end
  end
end

