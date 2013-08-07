Lorious::Application.routes.draw do

  root to: "pages#homepage"

  # USER AUTHENTICATION
  get "/auth/:provider/callback" => "authentications#create"
  get "/signout" => "sessions#destroy"

end
