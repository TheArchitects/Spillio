require 'spec_helper'

describe SessionsController do
  describe "GET #new" do
    it "redirects to facebook login" do
      get :new
      response.should redirect_to '/auth/facebook'
    end
  end
  describe 'Destroy' do
    it 'updates notice with a signed out message' do
      delete :destroy
      flash[:notice].should eq "Signed out"
    end
    it 'redirects to root url' do
      delete :destroy
      response.should redirect_to root_url
    end
  end
  describe 'failure' do
    it 'updates notice with an error message' do
      get :failure
      response.should redirect_to root_url
    end
    it 'redirects to root url' do
      get :failure
      flash[:notice].should eq "Login Failed, please try again."
    end
  end

  #describe "POST #create" do
    #context "with valid attributes" do
      #@some_info = {'name'=>'Jalal','email'=>'j@berkeley.edu'}
      #@auth_info = {'provider'=>'Some Provider','uid'=>'12345','info'=>@some_info }
      
    #end
  #end
end
