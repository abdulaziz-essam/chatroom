Rails.application.routes.draw do
  get "users/show"
  resources :rooms do 
    resources :messages
  end
  get "rooms/index"
  root "pages#home"
  get "pages/home"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Devise routes for user authentication
  devise_for :users

  # Corrected route for user profile
  get "user/:id", to: "users#show", as: "user"
end
