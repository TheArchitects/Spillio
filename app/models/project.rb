class Project < ActiveRecord::Base
  belongs_to :group
  attr_accessible :title, :url
end
