require 'test_helper'

class PetitionReviewMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @petition_review_member = petition_review_members(:one)
  end

  test "should get index" do
    get petition_review_members_url
    assert_response :success
  end

  test "should get new" do
    get new_petition_review_member_url
    assert_response :success
  end

  test "should create petition_review_member" do
    assert_difference('PetitionReviewMember.count') do
      post petition_review_members_url, params: { petition_review_member: { email: @petition_review_member.email, government_body_id: @petition_review_member.government_body_id, name: @petition_review_member.name, phone: @petition_review_member.phone, profession: @petition_review_member.profession } }
    end

    assert_redirected_to petition_review_member_url(PetitionReviewMember.last)
  end

  test "should show petition_review_member" do
    get petition_review_member_url(@petition_review_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_petition_review_member_url(@petition_review_member)
    assert_response :success
  end

  test "should update petition_review_member" do
    patch petition_review_member_url(@petition_review_member), params: { petition_review_member: { email: @petition_review_member.email, government_body_id: @petition_review_member.government_body_id, name: @petition_review_member.name, phone: @petition_review_member.phone, profession: @petition_review_member.profession } }
    assert_redirected_to petition_review_member_url(@petition_review_member)
  end

  test "should destroy petition_review_member" do
    assert_difference('PetitionReviewMember.count', -1) do
      delete petition_review_member_url(@petition_review_member)
    end

    assert_redirected_to petition_review_members_url
  end
end
