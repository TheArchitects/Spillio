class AuthenticatedController  < ApplicationController
	# This requires the user to be authenticated for viewing allother pages.
  #before_filter CASClient::Frameworks::Rails::Filter

  #before_filter do |c|
    # This may be nil if the user is not authenticated yet
    #@authenticated_user = User.find_by_cid(session[:cas_user])
  #end

  before_filter :authenticate
  before_filter :load_authenticated_user

  protected
  def authenticate
    CASClient::Frameworks::Rails::Filter
  end

  def load_authenticated_user
    @authenticated_user = User.find_by_cid(session[:cas_user])
  end
end
