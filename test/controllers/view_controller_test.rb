require "test_helper"

class ViewControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get view_show_url
    assert_response :success
  end

  test "should get edit" do
    get view_edit_url
    assert_response :success
  end
end
