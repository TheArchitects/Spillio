class ReaderRequest < ActiveRecord::Base
  has_one :requester, :class_name => "Student"
  attr_accessible :responded, :time_stamp, :requester

  def self.is_responded? request_id
  	self.find_by_id(request_id).responded
  end

  def get_requester
  	self.requester
  end

  def self.get_all_unresponded_requests
  	self.where(:responded => :false)
  end

end
