require 'rails_helper'

RSpec.describe "Pilot Profiles", type: :request do 

  describe "POST /pilot_profiles/new" do # Create a new pilot profile
    context "with valid parameters" do 
      it "creates a new pilot profile" do
      user = FactoryBot.create(:user)
      sign_in user
        
      expect {
          post pilot_profiles_path, params: { pilot_profile: attributes_for(:pilot_profile) }
      }.to change(PilotProfile, :count).by(1)

      follow_redirect!

      expect(response).to have_http_status(:ok)
      expect(response.body).to include( "testfirst" ) 
      end
  
  describe "GET /pilot_profiles" do # Check that /pilots returns successfully
    it "returns a success response" do
      user = FactoryBot.create(:user)
      sign_in user
      get pilot_profiles_path 
      expect(response).to have_http_status(:ok)
    
        end
      end

    context "with invalid parameters" do # Post with invalid params
      it "Doesn't create a new pilot profile with empty fields" do
        user = FactoryBot.create(:user)
        sign_in user
        expect { 
          post pilot_profiles_path, params: { pilot_profile: attributes_for(:pilot_profile, :emptyprofile) }
      }.to_not change(PilotProfile, :count)

      expect(response).to have_http_status(422) # Check that profile is not added to 
                                                # database and 422 error is returned
      end
    end
  end
  
  end
end
#TODO: test one to many relationship from profiles to forum posts and flight plans

# Feature Tests 

feature "Pilot Profile creation", type: :feature do
    user = FactoryBot.create(:user)
    pilot = FactoryBot.create(:pilot_profile)

    scenario "with valid pilot credentials" do

      # Log In
      visit "/users/sign_in"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"

      # Fill out form fields and create pilot profile
      visit "/pilot_profiles/new"
      fill_in "First name", with: pilot.first_name
      fill_in "Last name", with: pilot.last_name 
      fill_in "Aircraft ident", with: pilot.aircraft_ident
      fill_in "Aircraft type", with: pilot.aircraft_type 
      fill_in "Home address", with: pilot.home_address 
      fill_in "Phone number", with: pilot.phone_number 
      fill_in "Bio", with: pilot.bio

      click_button "Create Pilot profile"

      expect(page).to have_current_path(pilot_profile_path(PilotProfile.last))
      expect(page).to have_content("Profile was successfully created.")
    end

    scenario "With invalid pilot credentials" do 
      visit "/users/sign_in"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"

      visit "/pilot_profiles/new"
      fill_in "First name", with: ""
      fill_in "Last name", with: ""
      fill_in "Aircraft ident", with: ""
      fill_in "Aircraft type", with: ""
      fill_in "Home address", with: ""
      fill_in "Phone number", with: ""
      fill_in "Bio", with: ""

      click_button "Create Pilot profile"
      
      expect(page).to have_content("7 errors prohibited this pilot_profile from being saved:")
  end
end
