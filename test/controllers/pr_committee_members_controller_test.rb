require 'test_helper'

class PrCommitteeMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pr_committee_member = pr_committee_members(:one)
  end

  test "should get index" do
    get pr_committee_members_url
    assert_response :success
  end

  test "should get new" do
    get new_pr_committee_member_url
    assert_response :success
  end

  test "should create pr_committee_member" do
    assert_difference('PrCommitteeMember.count') do
      post pr_committee_members_url, params: { pr_committee_member: { about_the_member: @pr_committee_member.about_the_member, email: @pr_committee_member.email, first_name: @pr_committee_member.first_name, last_name: @pr_committee_member.last_name, organization: @pr_committee_member.organization, phone: @pr_committee_member.phone, pr_committee_id: @pr_committee_member.pr_committee_id, profession: @pr_committee_member.profession, title: @pr_committee_member.title } }
    end

    assert_redirected_to pr_committee_member_url(PrCommitteeMember.last)
  end

  test "should show pr_committee_member" do
    get pr_committee_member_url(@pr_committee_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_pr_committee_member_url(@pr_committee_member)
    assert_response :success
  end

  test "should update pr_committee_member" do
    patch pr_committee_member_url(@pr_committee_member), params: { pr_committee_member: { about_the_member: @pr_committee_member.about_the_member, email: @pr_committee_member.email, first_name: @pr_committee_member.first_name, last_name: @pr_committee_member.last_name, organization: @pr_committee_member.organization, phone: @pr_committee_member.phone, pr_committee_id: @pr_committee_member.pr_committee_id, profession: @pr_committee_member.profession, title: @pr_committee_member.title } }
    assert_redirected_to pr_committee_member_url(@pr_committee_member)
  end

  test "should destroy pr_committee_member" do
    assert_difference('PrCommitteeMember.count', -1) do
      delete pr_committee_member_url(@pr_committee_member)
    end

    assert_redirected_to pr_committee_members_url
  end
end
