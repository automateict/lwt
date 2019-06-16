require "application_system_test_case"

class PetitionReviewMembersTest < ApplicationSystemTestCase
  setup do
    @petition_review_member = petition_review_members(:one)
  end

  test "visiting the index" do
    visit petition_review_members_url
    assert_selector "h1", text: "Petition Review Members"
  end

  test "creating a Petition review member" do
    visit petition_review_members_url
    click_on "New Petition Review Member"

    fill_in "Email", with: @petition_review_member.email
    fill_in "Government body", with: @petition_review_member.government_body_id
    fill_in "Name", with: @petition_review_member.name
    fill_in "Phone", with: @petition_review_member.phone
    fill_in "Profession", with: @petition_review_member.profession
    click_on "Create Petition review member"

    assert_text "Petition review member was successfully created"
    click_on "Back"
  end

  test "updating a Petition review member" do
    visit petition_review_members_url
    click_on "Edit", match: :first

    fill_in "Email", with: @petition_review_member.email
    fill_in "Government body", with: @petition_review_member.government_body_id
    fill_in "Name", with: @petition_review_member.name
    fill_in "Phone", with: @petition_review_member.phone
    fill_in "Profession", with: @petition_review_member.profession
    click_on "Update Petition review member"

    assert_text "Petition review member was successfully updated"
    click_on "Back"
  end

  test "destroying a Petition review member" do
    visit petition_review_members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Petition review member was successfully destroyed"
  end
end
