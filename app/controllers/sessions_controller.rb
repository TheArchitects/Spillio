class SessionsController < ApplicationController
	def create
		auth = request.env["omniauth.auth"]
		user = FbUser.where(:provider => auth['provider'], 
		                :uid => auth['uid']).first || FbUser.create_with_omniauth(auth)
		session[:user_id] = user.id
		#redirect to user profile after successful signin
		redirect_to students_new_path
	end

	def new
		redirect_to '/auth/facebook'
	end

	def destroy
		reset_session
		#redirect to homepage
		redirect_to root_url, notice => 'Signed out'
	end

	def failure
		flash[:notice] = "Login Failed, please try again."
		redirect_to root_url
	end
end
