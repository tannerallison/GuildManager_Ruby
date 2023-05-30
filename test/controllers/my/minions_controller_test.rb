require "test_helper"

class My::::MinionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my__minions_index_url
    assert_response :success
  end

  test "should get show" do
    get my__minions_show_url
    assert_response :success
  end

  test "should get create" do
    get my__minions_create_url
    assert_response :success
  end

  test "should get update" do
    get my__minions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get my__minions_destroy_url
    assert_response :success
  end
end
