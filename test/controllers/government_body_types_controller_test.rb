require 'test_helper'

class GovernmentBodyTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @government_body_type = government_body_types(:one)
  end

  test "should get index" do
    get government_body_types_url
    assert_response :success
  end

  test "should get new" do
    get new_government_body_type_url
    assert_response :success
  end

  test "should create government_body_type" do
    assert_difference('GovernmentBodyType.count') do
      post government_body_types_url, params: { government_body_type: { description: @government_body_type.description, name: @government_body_type.name } }
    end

    assert_redirected_to government_body_type_url(GovernmentBodyType.last)
  end

  test "should show government_body_type" do
    get government_body_type_url(@government_body_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_government_body_type_url(@government_body_type)
    assert_response :success
  end

  test "should update government_body_type" do
    patch government_body_type_url(@government_body_type), params: { government_body_type: { description: @government_body_type.description, name: @government_body_type.name } }
    assert_redirected_to government_body_type_url(@government_body_type)
  end

  test "should destroy government_body_type" do
    assert_difference('GovernmentBodyType.count', -1) do
      delete government_body_type_url(@government_body_type)
    end

    assert_redirected_to government_body_types_url
  end
end
