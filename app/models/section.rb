class Section < ActiveRecord::Base
  has_many :students
  attr_accessible :number
end
