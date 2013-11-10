class CreateAssignmentsGroupsTable < ActiveRecord::Migration
  def up
    create_table :assignments_groups, :id => false do |t|
      t.references :assignment
      t.references :group
    end
    add_index :assignments_groups, [:assignment_id, :group_id]
    add_index :assignments_groups, :group_id
  end

  def down
    drop_table :assignments_groups
  end
end
