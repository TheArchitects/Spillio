class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "Student"
  belongs_to :post
  attr_accessible :text, :timestamp, :author
end
