require "test_helper"

class CreditorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get creditors_index_url
    assert_response :success
  end

  test "should get show" do
    get creditors_show_url
    assert_response :success
  end

  test "should get create" do
    get creditors_create_url
    assert_response :success
  end

  test "should get update" do
    get creditors_update_url
    assert_response :success
  end

  test "should get destroy" do
    get creditors_destroy_url
    assert_response :success
  end
end
