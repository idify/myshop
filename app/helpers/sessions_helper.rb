module SessionsHelper

	def current_user
			if session[:user_id].present?
				User.find(session[:user_id])
			end
	end
end
