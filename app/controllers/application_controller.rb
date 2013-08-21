class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def require_username
    if current_user.present? && !current_user.username.present?
      redirect_to edit_user_url
    end
  end

private
	def current_user
		@current_user ||= User.find_by_id(session[:user_id])
	end

end
