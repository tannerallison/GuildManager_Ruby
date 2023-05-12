require "test_helper"

class MinionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minion = minions(:one)
  end

  test "should get index" do
    get minions_url, as: :json
    assert_response :success
  end

  test "should create minion" do
    assert_difference("Minion.count") do
      post minions_url, params: { minion: { name: @minion.name, player_id: @minion.player_id, status: @minion.status } }, as: :json
    end

    assert_response :created
  end

  test "should show minion" do
    get minion_url(@minion), as: :json
    assert_response :success
  end

  test "should update minion" do
    patch minion_url(@minion), params: { minion: { name: @minion.name, player_id: @minion.player_id, status: @minion.status } }, as: :json
    assert_response :success
  end

  test "should destroy minion" do
    assert_difference("Minion.count", -1) do
      delete minion_url(@minion), as: :json
    end

    assert_response :no_content
  end
end
