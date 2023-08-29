require "test_helper"

class GachaControllerTest < ActionDispatch::IntegrationTest
  test "should get spin" do
    get gacha_spin_url
    assert_response :success
  end
end
