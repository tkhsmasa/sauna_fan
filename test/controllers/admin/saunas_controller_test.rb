require "test_helper"

class Admin::SaunasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_saunas_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_saunas_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_saunas_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_saunas_edit_url
    assert_response :success
  end
end
