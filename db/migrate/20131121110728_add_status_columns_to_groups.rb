class AddStatusColumnsToGroups < ActiveRecord::Migration
  def up
  	add_column :groups, :status, :string
  end

  def down
  	remove_column :groups, :status
  end
end
