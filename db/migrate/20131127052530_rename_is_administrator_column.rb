class RenameIsAdministratorColumn < ActiveRecord::Migration
  def up
  	remove_column :users, :is_administrator
  	add_column :users, :is_reader, :boolean, :default => false
  end

  def down
  	remove_column :users, :is_reader, :boolean
  	add_column :users, :is_administrator, :boolean, :default => false
  end
end
