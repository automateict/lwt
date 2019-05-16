require "application_system_test_case"

class CrCommitteeMembersTest < ApplicationSystemTestCase
  setup do
    @cr_committee_member = cr_committee_members(:one)
  end

  test "visiting the index" do
    visit cr_committee_members_url
    assert_selector "h1", text: "Cr Committee Members"
  end

  test "creating a Cr committee member" do
    visit cr_committee_members_url
    click_on "New Cr Committee Member"

    fill_in "About me", with: @cr_committee_member.about_me
    fill_in "Cr committee", with: @cr_committee_member.cr_committee_id
    fill_in "Email", with: @cr_committee_member.email
    fill_in "Full name", with: @cr_committee_member.full_name
    fill_in "Organization unit", with: @cr_committee_member.organization_unit_id
    fill_in "Phone", with: @cr_committee_member.phone
    fill_in "Title", with: @cr_committee_member.title
    click_on "Create Cr committee member"

    assert_text "Cr committee member was successfully created"
    click_on "Back"
  end

  test "updating a Cr committee member" do
    visit cr_committee_members_url
    click_on "Edit", match: :first

    fill_in "About me", with: @cr_committee_member.about_me
    fill_in "Cr committee", with: @cr_committee_member.cr_committee_id
    fill_in "Email", with: @cr_committee_member.email
    fill_in "Full name", with: @cr_committee_member.full_name
    fill_in "Organization unit", with: @cr_committee_member.organization_unit_id
    fill_in "Phone", with: @cr_committee_member.phone
    fill_in "Title", with: @cr_committee_member.title
    click_on "Update Cr committee member"

    assert_text "Cr committee member was successfully updated"
    click_on "Back"
  end

  test "destroying a Cr committee member" do
    visit cr_committee_members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cr committee member was successfully destroyed"
  end
end
