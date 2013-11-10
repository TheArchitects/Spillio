class GroupJoinRequest < ActiveRecord::Base
  #attr_accessible :group_id, :requestee, :requester
  belongs_to :group
  belongs_to :student, :foreign_key => :requestee
  belongs_to :student, :foreign_key => :requester
end
