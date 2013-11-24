class HomeController < ApplicationController

	#before_filter CASClient::Frameworks::Rails::GatewayFilter, :only => :user_profile
	#before_filter CASClient::Frameworks::Rails::Filter, :except => :index

	def index
		if (not session[:cas_user].nil?) and User.exists_with_cid? session[:cas_user]
			authenticated_user = User.find_by_cid(session[:cas_user])
			redirect_to group_db_show_url authenticated_user.group.id
		end

		@login_link = login_path

	end

end