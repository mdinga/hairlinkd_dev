require 'test_helper'

class ClientAccessControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get client_access_login_url
    assert_response :success
  end

  test "should get menu" do
    get client_access_menu_url
    assert_response :success
  end

end
