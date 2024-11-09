require 'rails_helper'

FactoryBot.define do
  factory :pilot_profile do 
    first_name { "testfirst" }
    last_name { "testlast" }
    aircraft_ident { "ABC-5432" }
    aircraft_type { "Cessna Skyhawk" }
    home_address { "12345 Test Ln, Test City, CO, 80208" }
    phone_number { 123456789 }
    bio { "Test, Test, Test, Test" }
  end

  factory :user do 
    email { "pilottest@example.com" }
    password { "password" }
    password_confirmation { "password" }
    end
end



RSpec.describe "Pilot Profiles", type: :request do 
  
  describe "POST /pilot_profiles/new" do # Create a new pilot profile and check that it redirects
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
    end
  end
end
#TODO: test one to many relationship from profiles to forum posts and flight plans
