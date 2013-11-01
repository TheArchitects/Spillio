class AddCidToStudents < ActiveRecord::Migration
  def change
    add_column :students, :cid, :integer
  end
end
