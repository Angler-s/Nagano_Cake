require "test_helper"

class Public::ItemGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_item_genres_index_url
    assert_response :success
  end
end
