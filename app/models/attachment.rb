class Attachment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :location, :type, :post
end
