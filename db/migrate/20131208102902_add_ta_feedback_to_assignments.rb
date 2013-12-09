class AddTaFeedbackToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :ta_feedback, :string
  end
end
