class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  attr_accessible :content, :date
end
