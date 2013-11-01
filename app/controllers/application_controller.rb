class ApplicationController < ActionController::Base
	require 'casclient'
	require 'casclient/frameworks/rails/filter'

  	protect_from_forgery
end
