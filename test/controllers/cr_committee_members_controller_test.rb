require 'test_helper'

class CrCommitteeMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cr_committee_member = cr_committee_members(:one)
  end

  test "should get index" do
    get cr_committee_members_url
    assert_response :success
  end

  test "should get new" do
    get new_cr_committee_member_url
    assert_response :success
  end

  test "should create cr_committee_member" do
    assert_difference('CrCommitteeMember.count') do
      post cr_committee_members_url, params: { cr_committee_member: { about_me: @cr_committee_member.about_me, cr_committee_id: @cr_committee_member.cr_committee_id, email: @cr_committee_member.email, full_name: @cr_committee_member.full_name, organization_unit_id: @cr_committee_member.organization_unit_id, phone: @cr_committee_member.phone, title: @cr_committee_member.title } }
    end

    assert_redirected_to cr_committee_member_url(CrCommitteeMember.last)
  end

  test "should show cr_committee_member" do
    get cr_committee_member_url(@cr_committee_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_cr_committee_member_url(@cr_committee_member)
    assert_response :success
  end

  test "should update cr_committee_member" do
    patch cr_committee_member_url(@cr_committee_member), params: { cr_committee_member: { about_me: @cr_committee_member.about_me, cr_committee_id: @cr_committee_member.cr_committee_id, email: @cr_committee_member.email, full_name: @cr_committee_member.full_name, organization_unit_id: @cr_committee_member.organization_unit_id, phone: @cr_committee_member.phone, title: @cr_committee_member.title } }
    assert_redirected_to cr_committee_member_url(@cr_committee_member)
  end

  test "should destroy cr_committee_member" do
    assert_difference('CrCommitteeMember.count', -1) do
      delete cr_committee_member_url(@cr_committee_member)
    end

    assert_redirected_to cr_committee_members_url
  end
end
