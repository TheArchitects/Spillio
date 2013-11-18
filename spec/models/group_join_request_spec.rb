require 'spec_helper'

describe GroupJoinRequest do
  before do
    @Group1 = Group.create
    @Requester = Student.create :name=>"Bob"
    @Requestee = Student.create :name=>"Sam"
  end

  describe "Group Join Request Creation" do
    it "should store references to its Group, Requestee, and Requester" do
      request = GroupJoinRequest.create :requestee=>@Requestee, :requester=>@Requester, :group=>@Group1
      GroupJoinRequest.where(:requestee=>@Requestee)[0].should eq(request)
    end
  end
end
