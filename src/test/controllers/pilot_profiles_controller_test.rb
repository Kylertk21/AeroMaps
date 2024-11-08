require "test_helper"

class PilotProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pilot_profile = pilot_profiles(:one)
  end

  test "should get index" do
    get pilot_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_pilot_profile_url
    assert_response :success
  end

  test "should create pilot_profile" do
    assert_difference("PilotProfile.count") do
      post pilot_profiles_url, params: { pilot_profile: { aircraft_ident: @pilot_profile.aircraft_ident, aircraft_type: @pilot_profile.aircraft_type, bio: @pilot_profile.bio, first_name: @pilot_profile.first_name, home_address: @pilot_profile.home_address, last_name: @pilot_profile.last_name, phone_number: @pilot_profile.phone_number } }
    end

    assert_redirected_to pilot_profile_url(PilotProfile.last)
  end

  test "should show pilot_profile" do
    get pilot_profile_url(@pilot_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_pilot_profile_url(@pilot_profile)
    assert_response :success
  end

  test "should update pilot_profile" do
    patch pilot_profile_url(@pilot_profile), params: { pilot_profile: { aircraft_ident: @pilot_profile.aircraft_ident, aircraft_type: @pilot_profile.aircraft_type, bio: @pilot_profile.bio, first_name: @pilot_profile.first_name, home_address: @pilot_profile.home_address, last_name: @pilot_profile.last_name, phone_number: @pilot_profile.phone_number } }
    assert_redirected_to pilot_profile_url(@pilot_profile)
  end

  test "should destroy pilot_profile" do
    assert_difference("PilotProfile.count", -1) do
      delete pilot_profile_url(@pilot_profile)
    end

    assert_redirected_to pilot_profiles_url
  end
end
