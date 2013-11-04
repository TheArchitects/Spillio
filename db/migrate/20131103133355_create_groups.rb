class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :owner
      t.integer :member_limit
      t.references :gsi
      t.references :project

      t.timestamps
    end
    add_index :groups, :owner_id
    add_index :groups, :gsi_id
    add_index :groups, :project_id
  end
end
