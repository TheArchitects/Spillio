class AuthenticatedController  < ApplicationController
	# This requires the user to be authenticated for viewing allother pages.
	before_filter CASClient::Frameworks::Rails::Filter

  before_filter do |c|
    # This may be nil if the user is not authenticated yet
    @authenticated_user = User.find_by_cid(session[:cas_user])
	@group_requests = GroupJoinRequest.find_all_by_requestee(@authenticated_user.id)
  end
end
