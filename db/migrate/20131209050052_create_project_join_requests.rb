class CreateProjectJoinRequests < ActiveRecord::Migration
  def change
    create_table :project_join_requests do |t|
      t.decimal :priority
      t.string :datetime
      t.references :group
      t.references :project

      t.timestamps
    end
  end
end
