Lorious::Application.routes.draw do

  root to: "pages#homepage"

  # USER AUTHENTICATION
  get "/auth/:provider/callback" => "authentications#create"
  get "/signout" => "sessions#destroy", as: :signout

  # USER MANAGMENET
  resources :users, only: [:edit, :update]

  # USER PAGES
  get "/account" => "users#show", as: :account
  get "/credits" => "users#credits", as: :credits
  get "/mailbox" => "users#mailbox", as: :mailbox
  get "/calendar" => "users#calendar", as: :calendar
  get "/new-card" => "users#new_card", as: :new_card
  post "/create-card" => "users#create_card", as: :create_card
  get "/new-bank-account" => "users#new_bank_account", as: :new_bank_account
  post "/create-bank-account" => "users#create_bank_account", as: :create_bank_account

  # CREDIT MANAGEMENT
  resources :credit_purchases, only: [:new, :create]
  resources :credit_payouts, only: [:new, :create]


  # APPOINTMENT MANAGEMENT
  resources :appointments, only: [:new, :create, :show, :index]
  scope ':username' do
    get "appointments/new" => "appointments#new_with_expert", as: :new_expert_appointment
  end
  resources :appointment_reviews, only: [:create]

  # MESSAGE MANAGEMENT
  resources :messages, only: [:new, :create]
  scope ':username' do
    get "messages/new" => "messages#new_with_expert", as: :new_expert_message
  end

  # EXPERT PROFILE
  get "/:username" => "users#profile", as: :user_profile

  # WAITING LIST ROUTE
  post "/waitinglist" => "pages#waitinglist"
end
