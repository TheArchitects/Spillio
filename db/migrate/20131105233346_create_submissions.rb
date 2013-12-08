class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :label
      t.string :type
      t.text :content
      t.datetime :submitted_date
      t.references :assignment

      t.timestamps
    end
    add_index :submissions, :assignment_id
  end
end
