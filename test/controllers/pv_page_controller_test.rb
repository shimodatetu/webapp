require 'test_helper'

class PvPageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get pv_page_show_url
    assert_response :success
  end

end
