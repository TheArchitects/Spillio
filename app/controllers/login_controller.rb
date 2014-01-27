require 'digest/sha2'

class LoginController < AuthenticatedController
	skip_before_filter :get_authenticated_user, :only => [:login, :logout, :fake_login, :index]

	@@god_key = "58fbd53cbd2048bed8d0721f7359fe19ad30406a92fddc9a1e60d816e28fb10f"

	def index
		if User.exists_with_cid? session[:cas_user]
			#existing user
			authenticated_user = User.find_by_cid(session[:cas_user])
			redirect_to student_path authenticated_user
		else
			#new user
			redirect_to new_student_path
		end
	end

	# Callback for after CalNet authentication
	def login
		@cid = session[:cas_user]
		@login_url = CASClient::Frameworks::Rails::Filter.login_url(self)
		#when the login was successful

		# TODO: take into account that an admin may log in
		redirect_to user_account_path
	end


	# TODO: remove or limit this & fake_logout to dev only
	# Manual login
	def fake_login
		if params.has_key?("hacker_key") &&
				params.has_key?("cid") &&
				is_god?(params[:hacker_key])

			CASClient::Frameworks::Rails::Filter.fake(params[:cid])
			flash[:success] = "You have successfully backdoored into the system"
			redirect_to root_url
		else
			flash[:warning] = "Were you trying to hack us?"
			redirect_to root_url
		end
	end


	def logout
		CASClient::Frameworks::Rails::Filter.logout(self)
	end

	# Manual logout
	def fake_logout
		CASClient::Frameworks::Rails::Filter.unfake
		redirect_to :logout
	end


	def self.get_cid
		@cid = session[:cas_user]
	end

	def self.logged_in?
		@cid!=nil
	end


	private

	def is_god?(key)
		digest = Digest::SHA2.new << key
		return digest == @@god_key
	end
end
