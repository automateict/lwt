require 'test_helper'

class PetitionReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @petition_report = petition_reports(:one)
  end

  test "should get index" do
    get petition_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_petition_report_url
    assert_response :success
  end

  test "should create petition_report" do
    assert_difference('PetitionReport.count') do
      post petition_reports_url, params: { petition_report: { decision_made: @petition_report.decision_made, petition_id: @petition_report.petition_id, pr_committee_id: @petition_report.pr_committee_id, remark: @petition_report.remark, report_date: @petition_report.report_date, title: @petition_report.title } }
    end

    assert_redirected_to petition_report_url(PetitionReport.last)
  end

  test "should show petition_report" do
    get petition_report_url(@petition_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_petition_report_url(@petition_report)
    assert_response :success
  end

  test "should update petition_report" do
    patch petition_report_url(@petition_report), params: { petition_report: { decision_made: @petition_report.decision_made, petition_id: @petition_report.petition_id, pr_committee_id: @petition_report.pr_committee_id, remark: @petition_report.remark, report_date: @petition_report.report_date, title: @petition_report.title } }
    assert_redirected_to petition_report_url(@petition_report)
  end

  test "should destroy petition_report" do
    assert_difference('PetitionReport.count', -1) do
      delete petition_report_url(@petition_report)
    end

    assert_redirected_to petition_reports_url
  end
end
