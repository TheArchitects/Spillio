class Instructor < User
  # attr_accessible :title, :body
	has_many :groups
	has_many :assignments
  attr_accessible :is_administrator

  def self.create_for_current_user!(s, current_user_id)
    instructor = Instructor.create(:name => s[:name], :cid => current_user_id)
    instructor.is_administrator = true
    instructor.save
    return instructor
  end
end
