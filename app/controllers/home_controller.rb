class HomeController < ApplicationController

	#before_filter CASClient::Frameworks::Rails::GatewayFilter, :only => :user_profile
	#before_filter CASClient::Frameworks::Rails::Filter, :except => :index

	def index
		

		if session[:cas_user]!=nil
			redirect_to user_account_path
		end

		@login_link = login_path

	end

end