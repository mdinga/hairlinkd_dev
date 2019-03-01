require 'test_helper'

class StylistHomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stylist_home_index_url
    assert_response :success
  end

end
