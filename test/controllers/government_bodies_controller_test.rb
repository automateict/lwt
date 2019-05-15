require 'test_helper'

class GovernmentBodiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @government_body = government_bodies(:one)
  end

  test "should get index" do
    get government_bodies_url
    assert_response :success
  end

  test "should get new" do
    get new_government_body_url
    assert_response :success
  end

  test "should create government_body" do
    assert_difference('GovernmentBody.count') do
      post government_bodies_url, params: { government_body: { city: @government_body.city, description: @government_body.description, email: @government_body.email, government_body_type_id: @government_body.government_body_type_id, name: @government_body.name, phone: @government_body.phone, region_id: @government_body.region_id, url: @government_body.url } }
    end

    assert_redirected_to government_body_url(GovernmentBody.last)
  end

  test "should show government_body" do
    get government_body_url(@government_body)
    assert_response :success
  end

  test "should get edit" do
    get edit_government_body_url(@government_body)
    assert_response :success
  end

  test "should update government_body" do
    patch government_body_url(@government_body), params: { government_body: { city: @government_body.city, description: @government_body.description, email: @government_body.email, government_body_type_id: @government_body.government_body_type_id, name: @government_body.name, phone: @government_body.phone, region_id: @government_body.region_id, url: @government_body.url } }
    assert_redirected_to government_body_url(@government_body)
  end

  test "should destroy government_body" do
    assert_difference('GovernmentBody.count', -1) do
      delete government_body_url(@government_body)
    end

    assert_redirected_to government_bodies_url
  end
end
