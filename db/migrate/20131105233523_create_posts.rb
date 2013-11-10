class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.datetime :date
      t.text :content
      t.references :user
      t.references :group
      t.references :assignment

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :group_id
    add_index :posts, :assignment_id
  end
end
