require 'test_helper'

class BrowseControllerTest < ActionController::TestCase
  test "should get category" do
    get :category
    assert_response :success
  end

  test "should get concern" do
    get :concern
    assert_response :success
  end

  test "should get service" do
    get :service
    assert_response :success
  end

  test "should get servprovider" do
    get :servprovider
    assert_response :success
  end

end
