require "application_system_test_case"

class SignaturesTest < ApplicationSystemTestCase
  setup do
    @signature = signatures(:one)
  end

  test "visiting the index" do
    visit signatures_url
    assert_selector "h1", text: "Signatures"
  end

  test "creating a Signature" do
    visit signatures_url
    click_on "New Signature"

    fill_in "Petition", with: @signature.petition_id
    fill_in "User", with: @signature.user_id
    click_on "Create Signature"

    assert_text "Signature was successfully created"
    click_on "Back"
  end

  test "updating a Signature" do
    visit signatures_url
    click_on "Edit", match: :first

    fill_in "Petition", with: @signature.petition_id
    fill_in "User", with: @signature.user_id
    click_on "Update Signature"

    assert_text "Signature was successfully updated"
    click_on "Back"
  end

  test "destroying a Signature" do
    visit signatures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Signature was successfully destroyed"
  end
end
