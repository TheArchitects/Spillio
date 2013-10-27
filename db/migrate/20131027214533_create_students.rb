class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.text :about
      t.references :section
      t.string :interest

      t.timestamps
    end
    add_index :students, :section_id
  end
end
