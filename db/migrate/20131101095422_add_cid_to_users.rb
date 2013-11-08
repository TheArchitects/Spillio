class AddCidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cid, :integer
  end
end
