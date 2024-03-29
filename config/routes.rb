Lorious::Application.routes.draw do

  root to: "pages#homepage"

  #temp route to code out profile design, search page
  get "/sample-profile" => "pages#sample_profile"
  get "/sample-search" => "pages#sample_search"

  # USER AUTHENTICATION
  get "/auth/:provider/callback" => "authentications#create"
  get "/signout" => "sessions#destroy", as: :signout

  # USER PAGES
  get "/account" => "users#show", as: :account
  get "/account/edit" => "users#edit", as: :edit_user
  patch "/account" => "users#update", as: :update_user
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
  resources :appointments, only: [:new, :create, :show, :index] do
    get "/confirm" => "appointments#confirm", as: :confirmation
  end

  scope ':username' do
    get "appointments/new" => "appointments#new_with_user", as: :new_user_appointment
  end

  resources :appointment_reviews, only: [:create]

  # MESSAGE MANAGEMENT
  resources :messages, only: [:new, :create]
  scope ':username' do
    get "messages/new" => "messages#new_with_expert", as: :new_expert_message
  end

  # WAITING LIST ROUTE
  post "/waitinglist" => "pages#waitinglist"

  # EXPERT PROFILE
  get "/search" => "search#new", as: :new_search
  post "/search" => "search#filter", as: :filter_search
  get "/:username" => "users#profile", as: :user_profile

end
