class GroupJoinRequest < ActiveRecord::Base
	attr_accessible :group_id, :requestee, :requester
	belongs_to :group
	belongs_to :requestee, :class_name => "Student"
	belongs_to :requester, :class_name => "Student"

	def self.valid_request?(requester, requestee)
	valid = ((not self.request_to_yourself?(requester, requestee)) and 
		(not self.request_exists?(requester, requestee)) and
		(not self.request_to_teammates?(requester, requestee)) and 
		(not self.request_to_full_teams?(requester, requestee)))
	return valid
	end

	def self.request_label(requester, requestee)
		if self.request_exists?(requester, requestee)
			label = 'Request Sent'
		elsif self.request_to_teammates?(requester, requestee)
			label = 'Already a Groupmate'
		elsif self.request_to_full_teams?(requester, requestee)
			label = 'Group Full'
		else
			label = 'This should not happen'
		end
		return label
	end

	private
	def self.request_to_yourself?(requester, requestee)
		return requester == requestee
	end

	def self.request_exists?(requester, requestee)
		return self.exists?(:requester_id => requester, :requestee_id => requestee)
	end

	def self.request_to_teammates?(requester, requestee)
		requester = Student.find(requester)
		requestee = Student.find(requestee)
		return requester.group.id == requestee.group.id
	end

	#TODO: check if team would be over the allowed cap
	def self.request_to_full_teams?(requester, requestee)
		return false
	end
end
