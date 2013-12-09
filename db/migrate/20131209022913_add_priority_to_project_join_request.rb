class AddPriorityToProjectJoinRequest < ActiveRecord::Migration
  def change
    add_column :project_join_requests, :priority, :decimal
  end
end
