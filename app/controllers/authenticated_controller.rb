class AuthenticatedController  < ApplicationController
	# This requires the user to be authenticated for viewing allother pages.
	before_filter CASClient::Frameworks::Rails::Filter
end
