class Notification < ActiveRecord::Base
  belongs_to :from, class_name: "Student"
  belongs_to :to, class_name: "Student"
  attr_accessible :response, :sender_notified, :timestamps, :type, :from, :to
end
