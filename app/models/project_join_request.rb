class ProjectJoinRequest < ActiveRecord::Base
  attr_accessible :requestee, :requester, :creation_time
  belongs_to :requester, :class_name => "Group"
  belongs_to :requestee, :class_name => "Project"

end 
