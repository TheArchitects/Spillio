class Post < ActiveRecord::Base
  belongs_to :author, class_name: "Student"
  belongs_to :group
  has_many :attachments, :comments
  attr_accessible :message, :timestamp, :type, :author
end
