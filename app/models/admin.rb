class Admin < ActiveRecord::Base
  attr_accessible :cid

  def self.exists_with_cid? cid
    find_by_cid(cid)!=nil
  end
end
