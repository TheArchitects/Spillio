class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :about
      t.references :section
      t.string :interest

      t.timestamps
    end
    add_index :users, :section_id
  end
end
