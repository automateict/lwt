require "application_system_test_case"

class CrCommitteesTest < ApplicationSystemTestCase
  setup do
    @cr_committee = cr_committees(:one)
  end

  test "visiting the index" do
    visit cr_committees_url
    assert_selector "h1", text: "Cr Committees"
  end

  test "creating a Cr committee" do
    visit cr_committees_url
    click_on "New Cr Committee"

    fill_in "Description", with: @cr_committee.description
    fill_in "Name", with: @cr_committee.name
    fill_in "Organization unit", with: @cr_committee.organization_unit_id
    click_on "Create Cr committee"

    assert_text "Cr committee was successfully created"
    click_on "Back"
  end

  test "updating a Cr committee" do
    visit cr_committees_url
    click_on "Edit", match: :first

    fill_in "Description", with: @cr_committee.description
    fill_in "Name", with: @cr_committee.name
    fill_in "Organization unit", with: @cr_committee.organization_unit_id
    click_on "Update Cr committee"

    assert_text "Cr committee was successfully updated"
    click_on "Back"
  end

  test "destroying a Cr committee" do
    visit cr_committees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cr committee was successfully destroyed"
  end
end
