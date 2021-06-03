require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get queue_position" do
    get pages_queue_position_url
    assert_response :success
  end

end
