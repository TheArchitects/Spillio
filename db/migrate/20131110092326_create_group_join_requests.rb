class CreateGroupJoinRequests < ActiveRecord::Migration
  def change
    create_table :group_join_requests do |t|
      t.integer :requester_id, :references => :user
      t.integer :requestee_id, :references => :user
      t.references :group

      t.timestamps
    end
  end
end
