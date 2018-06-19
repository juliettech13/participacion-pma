require "application_system_test_case"

class LegislationsTest < ApplicationSystemTestCase
  setup do
    @legislation = legislations(:one)
  end

  test "visiting the index" do
    visit legislations_url
    assert_selector "h1", text: "Legislations"
  end

  test "creating a Legislation" do
    visit legislations_url
    click_on "New Legislation"

    click_on "Create Legislation"

    assert_text "Legislation was successfully created"
    click_on "Back"
  end

  test "updating a Legislation" do
    visit legislations_url
    click_on "Edit", match: :first

    click_on "Update Legislation"

    assert_text "Legislation was successfully updated"
    click_on "Back"
  end

  test "destroying a Legislation" do
    visit legislations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Legislation was successfully destroyed"
  end
end
