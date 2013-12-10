class Project < ActiveRecord::Base
  belongs_to :group
  has_many :project_join_requests
  attr_accessible :title, :url, :description
end
