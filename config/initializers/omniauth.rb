Rails.application.config.middleware.use OmniAuth::Builder do

	provider :google_oauth2, GOOGLE_OAUTH2_CLIENT_ID, GOOGLE_OAUTH2_CLIENT_SECRET

end
