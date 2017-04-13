require 'test_helper'

class ItemsManagementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get items_management_index_url
    assert_response :success
  end

end
