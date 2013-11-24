class Post < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  belongs_to :assignment
  attr_accessible :content, :published_at, :author_id, :assignment_id
end
