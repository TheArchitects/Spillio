class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :group
      t.references :task

      t.timestamps
    end
    add_index :assignments, :group_id
  end
end
