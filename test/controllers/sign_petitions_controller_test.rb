require 'test_helper'

class SignPetitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sign_petition = sign_petitions(:one)
  end

  test "should get index" do
    get sign_petitions_url
    assert_response :success
  end

  test "should get new" do
    get new_sign_petition_url
    assert_response :success
  end

  test "should create sign_petition" do
    assert_difference('SignPetition.count') do
      post sign_petitions_url, params: { sign_petition: { email: @sign_petition.email, full_name: @sign_petition.full_name, petition_id: @sign_petition.petition_id, remark: @sign_petition.remark } }
    end

    assert_redirected_to sign_petition_url(SignPetition.last)
  end

  test "should show sign_petition" do
    get sign_petition_url(@sign_petition)
    assert_response :success
  end

  test "should get edit" do
    get edit_sign_petition_url(@sign_petition)
    assert_response :success
  end

  test "should update sign_petition" do
    patch sign_petition_url(@sign_petition), params: { sign_petition: { email: @sign_petition.email, full_name: @sign_petition.full_name, petition_id: @sign_petition.petition_id, remark: @sign_petition.remark } }
    assert_redirected_to sign_petition_url(@sign_petition)
  end

  test "should destroy sign_petition" do
    assert_difference('SignPetition.count', -1) do
      delete sign_petition_url(@sign_petition)
    end

    assert_redirected_to sign_petitions_url
  end
end
