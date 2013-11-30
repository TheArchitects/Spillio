class DropInstructors < ActiveRecord::Migration
  def up
  	drop_table :instructors
  end

  def down
  	create_table :instructors do |t|
      t.string :name

      t.timestamps
    end
  end
end
