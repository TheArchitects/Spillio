class AddScoreFieldToAssignments < ActiveRecord::Migration
  def change
  	add_column :assignments, :grade, :integer, :default => -1
  	add_column :assignments, :max_grade, :integer, :null => false, :default => -1
  end
end
