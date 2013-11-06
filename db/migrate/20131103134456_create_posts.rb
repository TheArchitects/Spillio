class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :type
      t.text :message
      t.references :author
      t.string :timestamp
      t.references :group

      t.timestamps
    end
    add_index :posts, :author_id
    add_index :posts, :group_id
  end
end
