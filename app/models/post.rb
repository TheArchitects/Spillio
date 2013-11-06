class Post < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :user
  belongs_to :group
  belongs_to :assignment
  attr_accessible :content, :date
=======
  belongs_to :author, class_name: "Student"
  belongs_to :group
  has_many :attachments, :comments
  attr_accessible :message, :timestamp, :type, :author
>>>>>>> f54d386e83e4db1b209a9f8db45b1c177b733f6e
end
