class Setting < ActiveRecord::Base

	attr_accessible :max_group_size

	def self.set_max_group_size size
		setting = self.first
		setting.max_group_size = size
		setting.save
	end

	def self.get_max_group_size
		self.first.max_group_size
	end
end