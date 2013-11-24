class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.decimal :score
      t.decimal :max_score
      t.references :assignment

      t.timestamps
    end
    add_index :scores, :assignment_id
  end
end
