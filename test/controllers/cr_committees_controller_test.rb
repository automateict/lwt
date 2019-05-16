require 'test_helper'

class CrCommitteesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cr_committee = cr_committees(:one)
  end

  test "should get index" do
    get cr_committees_url
    assert_response :success
  end

  test "should get new" do
    get new_cr_committee_url
    assert_response :success
  end

  test "should create cr_committee" do
    assert_difference('CrCommittee.count') do
      post cr_committees_url, params: { cr_committee: { description: @cr_committee.description, name: @cr_committee.name, organization_unit_id: @cr_committee.organization_unit_id } }
    end

    assert_redirected_to cr_committee_url(CrCommittee.last)
  end

  test "should show cr_committee" do
    get cr_committee_url(@cr_committee)
    assert_response :success
  end

  test "should get edit" do
    get edit_cr_committee_url(@cr_committee)
    assert_response :success
  end

  test "should update cr_committee" do
    patch cr_committee_url(@cr_committee), params: { cr_committee: { description: @cr_committee.description, name: @cr_committee.name, organization_unit_id: @cr_committee.organization_unit_id } }
    assert_redirected_to cr_committee_url(@cr_committee)
  end

  test "should destroy cr_committee" do
    assert_difference('CrCommittee.count', -1) do
      delete cr_committee_url(@cr_committee)
    end

    assert_redirected_to cr_committees_url
  end
end
