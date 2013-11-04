class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.string :timestamp
      t.references :author
      t.references :post

      t.timestamps
    end
    add_index :comments, :author_id
    add_index :comments, :post_id
  end
end
