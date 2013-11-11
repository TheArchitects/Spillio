class GroupJoinRequest < ActiveRecord::Base
  #attr_accessible :group_id, :requestee, :requester
  belongs_to :group
  belongs_to :requestee, :class_name => "Student"
  belongs_to :requester, :class_name => "Student"
end
