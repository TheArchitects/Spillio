class GroupJoinRequest < ActiveRecord::Base
	attr_accessible :requestee, :requester, :request_type
	belongs_to :requestee, :class_name => "Student"
	belongs_to :requester, :class_name => "Student"

	def self.valid_request?(requester, requestee)
		return (
				(not self.request_exists?(requester, requestee)) and
				(not self.request_to_teammates?(requester, requestee)) and
				(not self.request_to_full_teams?(requester, requestee)) and
				Setting.first.show_group_join_feature
			)
	end

	def self.request_label(requester_id, requestee_id)
		if self.valid_request?(requester_id, requestee_id)
			return self.generate_valid_request_type(requester_id, requestee_id)
		else
	    	return self.generate_reason_for_invalid_request(requester_id, requestee_id)
		end
	end

	private

	def self.generate_valid_request_type(requester_id, requestee_id)
		requester = Student.find(requester_id)
		requestee = Student.find(requestee_id)
		if requester.group_id.nil? and (not requestee.group_id.nil?)
			return 'join'
		elsif (not requester.group_id.nil?) and requestee.group_id.nil?
			return 'invite'
		elsif  (not requester.group_id.nil?) and (not requestee.group_id.nil?)
			return 'merge'
		end
	end

	def self.generate_reason_for_invalid_request(requester_id, requestee_id)
		if self.request_exists?(requester_id, requestee_id)
	      label = 'Request pending'
	    elsif self.request_to_teammates?(requester_id, requestee_id)
	      label = 'Already a groupmate'
	    elsif self.request_to_full_teams?(requester_id, requestee_id)
	      label = 'Group is full'
	    end
	    return label||""
	end

	def self.request_exists?(requester, requestee)
		return self.exists?(:requester_id => requester, :requestee_id => requestee)
	end

	def self.request_to_teammates?(requester_id, requestee_id)
		requester = Student.find(requester_id)
		requestee = Student.find(requestee_id)
		return requester.group_id == requestee.group_id
	end

	#TODO: check if team would be over the allowed cap
	def self.request_to_full_teams?(requester, requestee)
		requester_group_id = Student.find(requester).group_id
		requestee_group_id = Student.find(requestee).group_id

		if requestee_group_id.nil?
			requester_group = Group.find(requester_group_id)
			return requester_group.num_students == requester_group.max_size
		else
			requestee_group = Group.find(requestee_group_id)
			return requestee_group.num_students == requestee_group.max_size
		end
	end
end
