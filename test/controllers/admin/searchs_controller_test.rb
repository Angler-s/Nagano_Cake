require "test_helper"

class Admin::SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_searchs_index_url
    assert_response :success
  end
end
