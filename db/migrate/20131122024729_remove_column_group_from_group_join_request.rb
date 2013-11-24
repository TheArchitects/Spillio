class RemoveColumnGroupFromGroupJoinRequest < ActiveRecord::Migration
  def up
    remove_column :group_join_requests, :group_id
  end

  def down
    add_column :group_join_requests, :group_id, :integer
  end
end
