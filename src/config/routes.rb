Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  get 'home/index'
  get '/profile', to: 'pilot_profiles#redirect_to_profile'
  resources :forum_posts do
    resources :comments, only: [:create]
  end

  resources :flight_plans
  resources :pilot_profiles



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'map', to: 'map#show'

  # Defines the root path route ("/")
  root to: "home#index"
end