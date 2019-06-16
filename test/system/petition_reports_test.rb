require "application_system_test_case"

class PetitionReportsTest < ApplicationSystemTestCase
  setup do
    @petition_report = petition_reports(:one)
  end

  test "visiting the index" do
    visit petition_reports_url
    assert_selector "h1", text: "Petition Reports"
  end

  test "creating a Petition report" do
    visit petition_reports_url
    click_on "New Petition Report"

    fill_in "Decision made", with: @petition_report.decision_made
    fill_in "Petition", with: @petition_report.petition_id
    fill_in "Pr committee", with: @petition_report.pr_committee_id
    fill_in "Remark", with: @petition_report.remark
    fill_in "Report date", with: @petition_report.report_date
    fill_in "Title", with: @petition_report.title
    click_on "Create Petition report"

    assert_text "Petition report was successfully created"
    click_on "Back"
  end

  test "updating a Petition report" do
    visit petition_reports_url
    click_on "Edit", match: :first

    fill_in "Decision made", with: @petition_report.decision_made
    fill_in "Petition", with: @petition_report.petition_id
    fill_in "Pr committee", with: @petition_report.pr_committee_id
    fill_in "Remark", with: @petition_report.remark
    fill_in "Report date", with: @petition_report.report_date
    fill_in "Title", with: @petition_report.title
    click_on "Update Petition report"

    assert_text "Petition report was successfully updated"
    click_on "Back"
  end

  test "destroying a Petition report" do
    visit petition_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Petition report was successfully destroyed"
  end
end
