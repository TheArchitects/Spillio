class AddScoreFieldToAssignments < ActiveRecord::Migration
  def change
  	add_column :assignments, :grade, :decimal, :default => -1
  	add_column :assignments, :max_grade, :decimal, :null => false, :default => -1
  end
end
