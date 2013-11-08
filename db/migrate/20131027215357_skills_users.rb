class SkillsUsers < ActiveRecord::Migration
  def up
  	create_table :skills_users, :id => false do |t|
  		t.references :skill
  		t.references :user
  	end
  	add_index :skills_users, [:skill_id, :user_id], :unique => true
  end

  def down
  	drop_table :skills_users
  end
end
