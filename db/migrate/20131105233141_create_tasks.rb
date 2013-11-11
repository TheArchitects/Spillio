class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.belongs_to :author

      t.timestamps
    end
    add_index :tasks, :author_id
  end
end
