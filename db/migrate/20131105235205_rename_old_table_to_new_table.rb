class RenameOldTableToNewTable < ActiveRecord::Migration
	def self.up
		drop_table :users
	    rename_table :students, :users
	end 
	def self.down
		drop_table :users
	    rename_table :users, :students
	end
end
