class AddColumnRequestTypeToGroupJoinRequest < ActiveRecord::Migration
  def change
  	add_column :group_join_requests, :request_type, :string
  end
end
