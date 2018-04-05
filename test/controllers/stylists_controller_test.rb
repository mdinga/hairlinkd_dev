require 'test_helper'

class StylistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stylists_index_url
    assert_response :success
  end

  test "should get show" do
    get stylists_show_url
    assert_response :success
  end

  test "should get new" do
    get stylists_new_url
    assert_response :success
  end

  test "should get edit" do
    get stylists_edit_url
    assert_response :success
  end

  test "should get delete" do
    get stylists_delete_url
    assert_response :success
  end

end
