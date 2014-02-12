class Skill < ActiveRecord::Base
  belongs_to :student
  attr_accessible :name
end
