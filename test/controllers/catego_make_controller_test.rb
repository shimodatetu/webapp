require 'test_helper'

class CategoMakeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get catego_make_new_url
    assert_response :success
  end

end
