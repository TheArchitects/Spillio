class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :group_name
      t.references :instructor
      t.references :section

      t.timestamps
    end
    add_index :groups, :instructor_id
    add_index :groups, :section_id
  end
end
