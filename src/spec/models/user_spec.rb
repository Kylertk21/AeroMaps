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

# Rspec Tests
RSpec.describe "User model authentication", type: :request do 
  
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
      user = FactoryBot.build(:user)
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

# Feature tests

RSpec.feature "User Registration", type: :feature do
  scenario "User signs up with valid credentials" do 
    user = FactoryBot.build(:user)

    visit new_user_registration_path 

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password_confirmation

    click_button "Sign up"

    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Home")
  end
end


feature "User signs in", type: :feature do
    user = FactoryBot.build(:user)
    empty_user = FactoryBot.build(:user, :empty)
 
   scenario "User signs in with correct credentials" do 
    visit '/users/sign_in'
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"

      expect(page).to have_current_path(root_path)
      expect(page).to have_content("Home#index")
  end

  scenario "User can't sign in with invalid data" do
    visit '/users/sign_in'
      fill_in "Email", with: empty_user.email
      fill_in "Password", with: empty_user.password
      click_button "Log in"
    
      expect(page).to have_current_path(user_session_path)
      expect(page).to have_content("Invalid Email or password")

  end
end

