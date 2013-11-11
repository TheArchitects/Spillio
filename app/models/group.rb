class Group < ActiveRecord::Base

	has_and_belongs_to_many :assignments
	belongs_to :instructor
	belongs_to :section
	has_many :students
	has_many :scores
	has_many :submissions
	has_many :posts
	has_many :group_join_requests
	attr_accessible :group_name

  def self.delete_if_empty(group_id)
    if Group.exists? group_id
      group = Group.find group_id
      if group.students.count == 0
        group.destroy
      end
    end
  end

end
