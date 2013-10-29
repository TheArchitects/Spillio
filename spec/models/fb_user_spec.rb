require 'spec_helper'

describe FbUser do
  describe ".create_with_omniauth" do
    it "should create the user object" do
      @some_info = {'name'=>'Jalal','email'=>'j@berkeley.edu'}
      @auth = {'provider'=>'Some Provider', 'uid'=>'12345', 'info'=>@some_info }
      @some_user = FbUser.create_with_omniauth(@auth)
      @some_user.provider.should eq 'Some Provider'
      @some_user.uid.should eq '12345'
    end
  end
end
