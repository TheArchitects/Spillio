class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.text :description
      t.datetime :due_date
      t.references :instructor

      t.timestamps
    end
    add_index :assignments, :instructor_id
  end
end
