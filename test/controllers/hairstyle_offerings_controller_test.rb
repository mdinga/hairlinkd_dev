require 'test_helper'

class HairstyleOfferingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hairstyle_offerings_index_url
    assert_response :success
  end

  test "should get show" do
    get hairstyle_offerings_show_url
    assert_response :success
  end

  test "should get new" do
    get hairstyle_offerings_new_url
    assert_response :success
  end

  test "should get edit" do
    get hairstyle_offerings_edit_url
    assert_response :success
  end

  test "should get delete" do
    get hairstyle_offerings_delete_url
    assert_response :success
  end

end
