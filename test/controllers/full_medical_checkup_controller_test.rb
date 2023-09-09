require "test_helper"

class FullMedicalCheckupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get full_medical_checkup_index_url
    assert_response :success
  end

  test "should get show" do
    get full_medical_checkup_show_url
    assert_response :success
  end
end
