Lorious::Application.routes.draw do

  root to: "pages#homepage"

  # USER AUTHENTICATION
  get "/auth/:provider/callback" => "authentications#create"
  get "/signout" => "sessions#destroy", as: :signout

  # USER PAYMENTS
  get "/new-card" => "users#new_card", as: :new_card
  post "/create-card" => "users#create_card", as: :create_card
  get "/new-bank-account" => "users#new_bank_account", as: :new_bank_account
  post "/create-bank-account" => "users#create_bank_account", as: :create_bank_account

  # CREDIT MANAGEMENT
  resources :credit_purchases, only: [:new, :create]
  resources :credit_payouts, only: [:new, :create]

  # USER ACCOUNT
  get "/account" => "users#show", as: :account
  get "/credits" => "users#credits", as: :credits

  # EXPERT PROFILE
  get "/:username" => "users#profile", as: :user_profile

  # APPOINTMENT MANAGEMENT
  resources :appointment_requests, only: [:new, :create, :show]
  scope ':username' do
    get "appointment_requests/new" => "appointment_requests#new_with_expert", as: :new_expert_appointment_request
  end

end
