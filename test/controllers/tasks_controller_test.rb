require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get lang_change" do
    get tasks_lang_change_url
    assert_response :success
  end

end
