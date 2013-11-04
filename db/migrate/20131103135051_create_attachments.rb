class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :type
      t.references :post
      t.string :location

      t.timestamps
    end
    add_index :attachments, :post_id
  end
end
