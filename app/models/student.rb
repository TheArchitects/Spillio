
class Student < User
  belongs_to :group
  has_many :group_join_requests
  # attr_accessible :title, :body
  attr_accessible :id, :name, :group_id
end
