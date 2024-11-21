Rails.application.routes.draw do
  get 'comments/create'
  get 'home/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  resources :forum_posts
  resources :flight_plans
  resources :pilot_profiles
  resources :posts do 
    resources :comments, only: [:create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'map', to: 'map#show'

  # Defines the root path route ("/")
  root to: "home#index"
end
