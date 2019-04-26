require 'test_helper'

class HairstyleMatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hairstyle_matches_index_url
    assert_response :success
  end

  test "should get show" do
    get hairstyle_matches_show_url
    assert_response :success
  end

  test "should get new" do
    get hairstyle_matches_new_url
    assert_response :success
  end

  test "should get edit" do
    get hairstyle_matches_edit_url
    assert_response :success
  end

  test "should get delete" do
    get hairstyle_matches_delete_url
    assert_response :success
  end

end
