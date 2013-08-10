Lorious::Application.routes.draw do

  root to: "pages#homepage"

  # USER AUTHENTICATION
  get "/auth/:provider/callback" => "authentications#create"
  get "/signout" => "sessions#destroy", as: :signout

  # USER PAYMENTS
  get "/new-card" => "users#new_card", as: :new_card
  post "/create-card" => "users#create_card", as: :create_card

  # CREDIT MANAGEMENT
  resources :credit_purchases, only: [:new, :create]
  resources :credit_payouts, only: [:new, :create]

  # USER ACCOUNT
  get "/account" => "users#show", as: :account

  # EXPERT PROFILE
  get "/:username" => "profiles#show", as: :user_profile

end
