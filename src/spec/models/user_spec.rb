require 'rails_helper'

RSpec.describe "Users", type: :request do 
  
  describe "POST /users/new" do # Create a new user and check that it redirects
    context "with valid parameters" do 
      it "creates a new user" do
        expect {
          post users_path, params: { user: { email_address: "test@gmail.com", password: "password"} }
      }.to change(User, :count).by(1)

      expect(response).to have_http_status(:found)
      follow_redirect!
      expect(response.body).to include("test@gmail.com")
      
      end
  
  describe "GET /users" do # Check that /users returns successfully
    it "returns a success response" do
      get users_path 
      expect(response).to have_http_status(:ok)
    
        end
      end
    end

  context "with invalid parameters" do 
    it "does not create a new user and returns 422" do
      expect { 
        post users_path, params: { user: { email_address:"", password:""} }
    }.to_not change(User, :count)
    
    expect(response).to have_http_status(422)

      end
    end
  end
end
#TODO test user authentication with devise