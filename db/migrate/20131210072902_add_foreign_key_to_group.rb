class AddForeignKeyToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :project_join_request_id, :integer
  end
end
