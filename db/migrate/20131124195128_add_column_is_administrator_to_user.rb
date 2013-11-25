class AddColumnIsAdministratorToUser < ActiveRecord::Migration
  def up
    add_column :users, :is_administrator, :boolean, :default => false
  end

  def down
    remove_column :users, :is_administrator
  end
end
