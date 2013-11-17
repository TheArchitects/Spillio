class AuthenticatedController  < ApplicationController
	# This requires the user to be authenticated for viewing allother pages.
  #before_filter CASClient::Frameworks::Rails::Filter

<<<<<<< HEAD
  #before_filter do |c|
=======
  before_filter :get_authenticated_user


  # Gets from the db the authenticated user model, returns forbidden if there
  # is not anyone.
  def get_authenticated_user
>>>>>>> 34541503d3a58ef7e36cc0c49d87c44f2c56c08c
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
    if @authenticated_user.nil?
      head :forbidden and return false
    end
  end
end
