require 'test_helper'

class HairstyleCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hairstyle_categories_index_url
    assert_response :success
  end

  test "should get show" do
    get hairstyle_categories_show_url
    assert_response :success
  end

  test "should get new" do
    get hairstyle_categories_new_url
    assert_response :success
  end

  test "should get edit" do
    get hairstyle_categories_edit_url
    assert_response :success
  end

  test "should get delete" do
    get hairstyle_categories_delete_url
    assert_response :success
  end

end
