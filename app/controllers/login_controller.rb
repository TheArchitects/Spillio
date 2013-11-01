class LoginController < AuthenticatedController
	
	
	def index
		
		if StudentsController.cid_exists? session[:cas_user]
			#existed user
			redirect_to student_show_by_cid_path(session[:cas_user])
		else 
			#new user
			redirect_to new_student_path
		end

	end

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
