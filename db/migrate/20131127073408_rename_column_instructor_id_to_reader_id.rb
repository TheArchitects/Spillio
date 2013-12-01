class RenameColumnInstructorIdToReaderId < ActiveRecord::Migration
  def up
  	remove_column :groups, :instructor_id
  	add_column :groups, :reader_id, :integer, :references => :user
  end

  def down
  end
end
