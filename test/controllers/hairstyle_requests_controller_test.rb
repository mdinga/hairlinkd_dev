require 'test_helper'

class HairstyleRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hairstyle_requests_index_url
    assert_response :success
  end

  test "should get show" do
    get hairstyle_requests_show_url
    assert_response :success
  end

  test "should get new" do
    get hairstyle_requests_new_url
    assert_response :success
  end

  test "should get edit" do
    get hairstyle_requests_edit_url
    assert_response :success
  end

  test "should get delete" do
    get hairstyle_requests_delete_url
    assert_response :success
  end

end
