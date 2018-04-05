require 'test_helper'

class HairstyleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hairstyle_index_url
    assert_response :success
  end

  test "should get show" do
    get hairstyle_show_url
    assert_response :success
  end

  test "should get new" do
    get hairstyle_new_url
    assert_response :success
  end

  test "should get edit" do
    get hairstyle_edit_url
    assert_response :success
  end

  test "should get delete" do
    get hairstyle_delete_url
    assert_response :success
  end

end
