class Skill < ActiveRecord::Base
  belongs_to :students
  attr_accessible :name
end
