class AddGroupToUsers < ActiveRecord::Migration
  def change
    add_column :users, :group, :references
  end
end
