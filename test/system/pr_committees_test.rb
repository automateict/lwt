require "application_system_test_case"

class PrCommitteesTest < ApplicationSystemTestCase
  setup do
    @pr_committee = pr_committees(:one)
  end

  test "visiting the index" do
    visit pr_committees_url
    assert_selector "h1", text: "Pr Committees"
  end

  test "creating a Pr committee" do
    visit pr_committees_url
    click_on "New Pr Committee"

    fill_in "Deadline", with: @pr_committee.deadline
    fill_in "Name", with: @pr_committee.name
    fill_in "Petition", with: @pr_committee.petition_id
    click_on "Create Pr committee"

    assert_text "Pr committee was successfully created"
    click_on "Back"
  end

  test "updating a Pr committee" do
    visit pr_committees_url
    click_on "Edit", match: :first

    fill_in "Deadline", with: @pr_committee.deadline
    fill_in "Name", with: @pr_committee.name
    fill_in "Petition", with: @pr_committee.petition_id
    click_on "Update Pr committee"

    assert_text "Pr committee was successfully updated"
    click_on "Back"
  end

  test "destroying a Pr committee" do
    visit pr_committees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pr committee was successfully destroyed"
  end
end
