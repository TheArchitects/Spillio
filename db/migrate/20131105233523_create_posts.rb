class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.datetime :published_at
      t.text :content
      t.belongs_to :author
      t.references :assignment

      t.timestamps
    end
    add_index :posts, :author_id
    add_index :posts, :assignment_id
  end
end
