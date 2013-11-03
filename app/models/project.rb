class Project < ActiveRecord::Base
  has_one :group
  attr_accessible :description, :name, :timestamp
end
