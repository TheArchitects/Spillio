class DropFbUsers < ActiveRecord::Migration
  def up
  	drop_table(:fb_users)
  end

  def down
  end
end
