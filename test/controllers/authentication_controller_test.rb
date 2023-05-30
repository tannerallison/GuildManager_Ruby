require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get authentication_login_url
    assert_response :success
  end

  test "should get authenticate" do
    get authentication_authenticate_url
    assert_response :success
  end
end
