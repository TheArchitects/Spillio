
class Student < User
  belongs_to :group
  # attr_accessible :title, :body
  attr_accessible :id, :name, :group_id
end
