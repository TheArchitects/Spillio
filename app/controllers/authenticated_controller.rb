class AuthenticatedController  < ApplicationController
	# This requires the user to be authenticated for viewing allother pages.
	before_filter CASClient::Frameworks::Rails::Filter

  before_filter :get_authenticated_user


  # Gets from the db the authenticated user model, returns forbidden if there
  # is not anyone.
  def get_authenticated_user
    # This may be nil if the user is not authenticated yet
    @authenticated_user = User.find_by_cid(session[:cas_user])
    if @authenticated_user.nil?
      head :forbidden and return false
    end
  end
end
