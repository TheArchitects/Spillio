class Section < ActiveRecord::Base
  has_many :students
  has_many :groups
  attr_accessible :number
end
