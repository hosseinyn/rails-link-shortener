require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get links_add_url
    assert_response :success
  end
end
