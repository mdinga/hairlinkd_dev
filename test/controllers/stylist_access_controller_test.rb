require 'test_helper'

class StylistAccessControllerTest < ActionDispatch::IntegrationTest
  test "should get stylist_login" do
    get stylist_access_stylist_login_url
    assert_response :success
  end

  test "should get stylist_menu" do
    get stylist_access_stylist_menu_url
    assert_response :success
  end

end
