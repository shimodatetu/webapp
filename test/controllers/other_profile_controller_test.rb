require 'test_helper'

class OtherProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get other_profile_show_url
    assert_response :success
  end

end
