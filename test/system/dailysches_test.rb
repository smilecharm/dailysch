require "application_system_test_case"

class DailyschesTest < ApplicationSystemTestCase
  setup do
    @dailysch = dailysches(:one)
  end

  test "visiting the index" do
    visit dailysches_url
    assert_selector "h1", text: "Dailysches"
  end

  test "creating a Dailysch" do
    visit dailysches_url
    click_on "New Dailysch"

    fill_in "Client", with: @dailysch.client
    fill_in "Counsellor", with: @dailysch.counsellor
    fill_in "Date", with: @dailysch.date
    fill_in "Ref", with: @dailysch.ref
    fill_in "Time", with: @dailysch.time
    click_on "Create Dailysch"

    assert_text "Dailysch was successfully created"
    click_on "Back"
  end

  test "updating a Dailysch" do
    visit dailysches_url
    click_on "Edit", match: :first

    fill_in "Client", with: @dailysch.client
    fill_in "Counsellor", with: @dailysch.counsellor
    fill_in "Date", with: @dailysch.date
    fill_in "Ref", with: @dailysch.ref
    fill_in "Time", with: @dailysch.time
    click_on "Update Dailysch"

    assert_text "Dailysch was successfully updated"
    click_on "Back"
  end

  test "destroying a Dailysch" do
    visit dailysches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dailysch was successfully destroyed"
  end
end
