require "test_helper"

class LoansControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get loans_new_url
    assert_response :success
  end
end
