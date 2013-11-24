class CreateSettings < ActiveRecord::Migration
	def change
	    create_table :settings do |t|
	      t.integer :max_group_size
	    end
  	end
end
