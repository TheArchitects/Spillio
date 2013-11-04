class Section < ActiveRecord::Base
  has_many :students
  belongs_to :course
  attr_accessible :number
end
