require 'test_helper'

class ProfileSavedInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profile_saved_infos_index_url
    assert_response :success
  end

end
