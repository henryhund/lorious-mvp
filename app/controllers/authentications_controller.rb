class AuthenticationsController < ApplicationController

	def create
		omniauth = request.env["omniauth.auth"]
		authentication = Authentication.find_by_provider_and_uid(omniauth["provider"], omniauth["uid"])

		if authentication.present?
			sign_in_user(authentication.user)
		elsif current_user.present?
			add_authentication_to_user(current_user, omniauth)
		else
			register_user_from_omniauth(omniauth)
		end

		redirect_to root_url
	end

private
	def sign_in_user(user)
		flash[:notice] = t('user.signin.success')
		session[:user_id] = user.id
	end

	def add_authentication_to_user(user, omniauth)
		user.authentications.create!(provider: omniauth["provider"], uid: omniauth["uid"])
		flash[:notice] = t('user.authentication.success')
	end

	def register_user_from_omniauth(omniauth)
		user = User.new(email: omniauth[:info][:email], firstname: omniauth[:info][:first_name], lastname: omniauth[:info][:last_name], avatar_url: omniauth[:info][:image])
		user.authentications.build(provider: omniauth["provider"], uid: omniauth["uid"])
		user.save!
		flash[:notice] = t('user.registration.success')
		session[:user_id] = user.id
	end

end

### GOOGLE CALENDAR LOGIC FOR LATER
# require "google/api_client"
# token = omniauth["credentials"]["token"]
# client = Google::APIClient.new
# client.authorization.access_token = token
# service = client.discovered_api('calendar', 'v3')
# result = client.execute(
# 	api_method: service.calendar_list.list,
# 	parameters: {},
# 	headers: { "Content-Type" => "application/json" }
# )

# render json: result.data
