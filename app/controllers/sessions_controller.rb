class SessionsController < ApplicationController

	def create
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = t('user.signout.success')
		redirect_to root_url
	end

end
