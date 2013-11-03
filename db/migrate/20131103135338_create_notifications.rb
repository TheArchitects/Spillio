class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :type
      t.references :from
      t.references :to
      t.boolean :sender_notified, default: false
      t.string :response, default: "No Response"
      t.string :timestamps

      t.timestamps
    end
    add_index :notifications, :from_id
    add_index :notifications, :to_id
  end
end
