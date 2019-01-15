require 'test_helper'

class ThreadAllControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get thread_all_index_url
    assert_response :success
  end

end
