class ReaderRequest < ActiveRecord::Base
  attr_accessible :responded, :time_stamp, :user

  def is_responded? request_id
  	self.find_by_id(request_id).responded
  end

  def get_user request_id
  	self.find_by_id(request_id).user
  end

end
