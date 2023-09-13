require "test_helper"

class FullMedicalCheckupControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get full_medical_checkup_new_url
    assert_response :success
  end

  test "should get show" do
    get full_medical_checkup_show_url
    assert_response :success
  end
end
