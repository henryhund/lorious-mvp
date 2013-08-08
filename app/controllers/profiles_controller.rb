class ProfilesController < ApplicationController

	def show
		@expert = User.find_by_username(params[:username])
	end

end
