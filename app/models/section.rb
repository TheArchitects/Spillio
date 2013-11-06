class Section < ActiveRecord::Base
  has_many :students
<<<<<<< HEAD
  has_many :groups
=======
  belongs_to :course
>>>>>>> f54d386e83e4db1b209a9f8db45b1c177b733f6e
  attr_accessible :number
end
