require 'spec_helper'
require 'pp'

describe GroupJoinController do
  before(:each) do
    GroupJoinRequest.delete_all
    @Requester = Student.create :name=> "John"
    controller.stub(:authenticate)
    controller.stub(:load_authenticated_user)
    controller.instance_variable_set(:@authenticated_user, @Requester)
    @Requestee = Student.create :name=> "Sally"
    @Group1 = Group.create
    @Group1.students << @Requestee
    request.env['HTTP_REFERER'] = '/search/students'
  end

  describe "request creation" do
    it "allows a student to request someone" do
      expect { post 'create', {:requestee => @Requestee} }.to change { GroupJoinRequest.count }.by(1)
    end

    it "has a reference to the Requester and the Requestee" do
      get 'create', {:requestee=>@Requestee}
      @GroupRequest = GroupJoinRequest.all[0]
      expect(@GroupRequest.requestee).to eq @Requestee
      expect(@GroupRequest.requester).to eq @Requester
    end
  end
end
