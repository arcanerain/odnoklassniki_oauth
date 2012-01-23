require 'test_helper'

class OdOauthControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get callback" do
    get :callback
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
