class ApplicationController < ActionController::Base
  protect_from_forgery

	def require_user
		if !session[:user_id].present?
			redirect_to login_path
		end
	end
end
