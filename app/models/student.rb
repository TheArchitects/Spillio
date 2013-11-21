
class Student < User
	belongs_to :group
	has_many :group_join_requests
	# attr_accessible :title, :body
	attr_accessible :id, :name, :group_id

    # Checks if this student can potentially be joined in a group by another
	def joinable_by?(other_student)
	  # False if self doesn't have a group or self equals the other student
	  return (
	      (not other_student == self)
	    )
	end

end
