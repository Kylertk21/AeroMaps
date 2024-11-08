require "application_system_test_case"

class PilotProfilesTest < ApplicationSystemTestCase
  setup do
    @pilot_profile = pilot_profiles(:one)
  end

  test "visiting the index" do
    visit pilot_profiles_url
    assert_selector "h1", text: "Pilot profiles"
  end

  test "should create pilot profile" do
    visit pilot_profiles_url
    click_on "New pilot profile"

    fill_in "Aircraft ident", with: @pilot_profile.aircraft_ident
    fill_in "Aircraft type", with: @pilot_profile.aircraft_type
    fill_in "Bio", with: @pilot_profile.bio
    fill_in "First name", with: @pilot_profile.first_name
    fill_in "Home address", with: @pilot_profile.home_address
    fill_in "Last name", with: @pilot_profile.last_name
    fill_in "Phone number", with: @pilot_profile.phone_number
    click_on "Create Pilot profile"

    assert_text "Pilot profile was successfully created"
    click_on "Back"
  end

  test "should update Pilot profile" do
    visit pilot_profile_url(@pilot_profile)
    click_on "Edit this pilot profile", match: :first

    fill_in "Aircraft ident", with: @pilot_profile.aircraft_ident
    fill_in "Aircraft type", with: @pilot_profile.aircraft_type
    fill_in "Bio", with: @pilot_profile.bio
    fill_in "First name", with: @pilot_profile.first_name
    fill_in "Home address", with: @pilot_profile.home_address
    fill_in "Last name", with: @pilot_profile.last_name
    fill_in "Phone number", with: @pilot_profile.phone_number
    click_on "Update Pilot profile"

    assert_text "Pilot profile was successfully updated"
    click_on "Back"
  end

  test "should destroy Pilot profile" do
    visit pilot_profile_url(@pilot_profile)
    click_on "Destroy this pilot profile", match: :first

    assert_text "Pilot profile was successfully destroyed"
  end
end
