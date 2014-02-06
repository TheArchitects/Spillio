class AddStatusToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :status, :string, default: :stand_by
  end
end
