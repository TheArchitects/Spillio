class AddForeignKeyToProject < ActiveRecord::Migration
  def change
    add_column :projects, :project_join_request_id, :integer
  end
end
