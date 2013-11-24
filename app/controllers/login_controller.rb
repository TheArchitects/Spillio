class LoginController < AuthenticatedController
	skip_before_filter :get_authenticated_user, :only => [:login, :index]

	def index
		if User.exists_with_cid? session[:cas_user]
			#existing user
			authenticated_user = User.find_by_cid(session[:cas_user])
			redirect_to group_db_show_url authenticated_user.group.id
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
		redirect_to user_account_path
	end


	def logout
		CASClient::Frameworks::Rails::Filter.logout(self)
	end

	def self.get_cid
		@cid = session[:cas_user]
	end

	def self.logged_in?
		@cid!=nil
	end
end
