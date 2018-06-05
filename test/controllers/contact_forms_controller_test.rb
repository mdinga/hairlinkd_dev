require 'test_helper'

class ContactFormsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get contact_forms_new_url
    assert_response :success
  end

  test "should get show" do
    get contact_forms_show_url
    assert_response :success
  end

  test "should get delete" do
    get contact_forms_delete_url
    assert_response :success
  end

end
