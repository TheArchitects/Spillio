class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :content
      t.datetime :submitted_date
      t.references :group
      t.references :assignment

      t.timestamps
    end
    add_index :submissions, :group_id
    add_index :submissions, :assignment_id
  end
end
