require 'rails_helper'

RSpec.describe "Pilot Profiles", type: :request do 
  
  describe "POST /pilot_profiles/new" do # Create a new pilot profile and check that it redirects
    context "with valid parameters" do 
      it "creates a new pilot profile" do
        expect {
          post pilot_profiles_path, params: { pilot_profiles: { first_name:"test", last_name:"test", 
          aircraft_ident:"test", aircraft_type:"test", home_address:"1234 test dr", phone_number:"1234567",
          bio:"testing testing testing testing",  } }
      }.to change(PilotProfile, :count).by(1)

      expect(response).to have_http_status(:found)
      follow_redirect!
      expect(response.body).to include("1234 test dr")
      
      end
  
  describe "GET /pilot_profiles" do # Check that /users returns successfully
    it "returns a success response" do
      get pilot_profiles_path 
      expect(response).to have_http_status(:ok)
    
        end
      end
    end
  end
end
#TODO: test one to many relationship from profiles to forum posts and flight plans
