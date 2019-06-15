require "application_system_test_case"

class PetitionsTest < ApplicationSystemTestCase
  setup do
    @petition = petitions(:one)
  end

  test "visiting the index" do
    visit petitions_url
    assert_selector "h1", text: "Petitions"
  end

  test "creating a Petition" do
    visit petitions_url
    click_on "New Petition"

    fill_in "Government body", with: @petition.government_body_id
    check "Need for email notification" if @petition.need_for_email_notification
    fill_in "Petition details", with: @petition.petition_details
    fill_in "Sector", with: @petition.sector_id
    fill_in "Status", with: @petition.status
    fill_in "Target of signatures", with: @petition.target_of_signatures
    fill_in "Title", with: @petition.title
    fill_in "User", with: @petition.user_id
    click_on "Create Petition"

    assert_text "Petition was successfully created"
    click_on "Back"
  end

  test "updating a Petition" do
    visit petitions_url
    click_on "Edit", match: :first

    fill_in "Government body", with: @petition.government_body_id
    check "Need for email notification" if @petition.need_for_email_notification
    fill_in "Petition details", with: @petition.petition_details
    fill_in "Sector", with: @petition.sector_id
    fill_in "Status", with: @petition.status
    fill_in "Target of signatures", with: @petition.target_of_signatures
    fill_in "Title", with: @petition.title
    fill_in "User", with: @petition.user_id
    click_on "Update Petition"

    assert_text "Petition was successfully updated"
    click_on "Back"
  end

  test "destroying a Petition" do
    visit petitions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Petition was successfully destroyed"
  end
end
