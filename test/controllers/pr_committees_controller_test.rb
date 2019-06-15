require 'test_helper'

class PrCommitteesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pr_committee = pr_committees(:one)
  end

  test "should get index" do
    get pr_committees_url
    assert_response :success
  end

  test "should get new" do
    get new_pr_committee_url
    assert_response :success
  end

  test "should create pr_committee" do
    assert_difference('PrCommittee.count') do
      post pr_committees_url, params: { pr_committee: { deadline: @pr_committee.deadline, name: @pr_committee.name, petition_id: @pr_committee.petition_id } }
    end

    assert_redirected_to pr_committee_url(PrCommittee.last)
  end

  test "should show pr_committee" do
    get pr_committee_url(@pr_committee)
    assert_response :success
  end

  test "should get edit" do
    get edit_pr_committee_url(@pr_committee)
    assert_response :success
  end

  test "should update pr_committee" do
    patch pr_committee_url(@pr_committee), params: { pr_committee: { deadline: @pr_committee.deadline, name: @pr_committee.name, petition_id: @pr_committee.petition_id } }
    assert_redirected_to pr_committee_url(@pr_committee)
  end

  test "should destroy pr_committee" do
    assert_difference('PrCommittee.count', -1) do
      delete pr_committee_url(@pr_committee)
    end

    assert_redirected_to pr_committees_url
  end
end
