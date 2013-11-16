class Assignment < ActiveRecord::Base
	belongs_to :instructor
	has_and_belongs_to_many :groups
	has_many :scores
	has_many :submissions
	has_many :posts
	attr_accessible :title, :description, :due_date

end
