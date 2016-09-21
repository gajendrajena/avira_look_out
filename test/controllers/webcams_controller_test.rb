require 'test_helper'

class WebcamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @webcam = webcams(:one)
  end

  test "should get index" do
    get webcams_url
    assert_response :success
  end

  test "should get new" do
    get new_webcam_url
    assert_response :success
  end

  test "should create webcam" do
    assert_difference('Webcam.count') do
      post webcams_url, params: { webcam: { name: @webcam.name } }
    end

    assert_redirected_to webcam_url(Webcam.last)
  end

  test "should show webcam" do
    get webcam_url(@webcam)
    assert_response :success
  end

  test "should get edit" do
    get edit_webcam_url(@webcam)
    assert_response :success
  end

  test "should update webcam" do
    patch webcam_url(@webcam), params: { webcam: { name: @webcam.name } }
    assert_redirected_to webcam_url(@webcam)
  end

  test "should destroy webcam" do
    assert_difference('Webcam.count', -1) do
      delete webcam_url(@webcam)
    end

    assert_redirected_to webcams_url
  end
end
