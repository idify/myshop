class SessionsController < ApplicationController

	def create
		user = User.find_by_email_and_password(params[:email],params[:password])
		if user.present?
				session[:user_id] = user.id
				redirect_to "/"
		else
				flash[:error] = "Invalide User email or password"
				redirect_to login_path
		end
	end

	def delete
		if session[:user_id]
			session[:user_id] = nil
		end
		redirect_to "/"
	end
end
