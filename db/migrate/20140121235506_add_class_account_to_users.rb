class AddClassAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :class_account, :string
  end
end
