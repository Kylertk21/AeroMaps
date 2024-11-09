require 'rails_helper'

FactoryBot.define do
  factory :user do 
    email { "test@example.com" }
    password { "password" }
    password_confirmation { "password" }
    end
  trait :empty do
    email { "" }
    password { "" }
    password_confirmation { "" }
    end
  trait :invalidpw do 
    email { "test@example.com" }
    password { "password" }
    password_confirmation { "otherpassword" }
    end
end

RSpec.describe "Users", type: :request do 
  
  describe "POST /users/new" do # Create a new user and check that it redirects
    context "with valid parameters" do 
      it "creates a new user" do
        expect {
          post user_registration_path, params: { user: attributes_for(:user) } 
      }.to change(User, :count).by(1)
      
      expect(response).to have_http_status(:see_other)
      
      end
  
  describe "GET /users" do # Check that user is authenticated and can access home page
    it "returns a success response" do
      user = FactoryBot.create(:user)
      sign_in user

      get home_index_path
      expect(response).to have_http_status(:ok)
    
        end
      end
    end

  context "with invalid parameters" do 
    
    it "does not create a new user with empty fields" do
      expect { 
        post user_registration_path, params: { user: attributes_for(:user, :empty) }
    }.to_not change(User, :count)
    
    expect(response).to have_http_status(422)

      end
      
    it "does not create a new user with mismatched password fields" do
      expect { 
        post user_registration_path, params: { user: attributes_for(:user, :invalidpw) }
    }.to_not change(User, :count)
      
    expect(response).to have_http_status(422)
  
      end

    end
  end
end
