class AddShowGroupJoinFeatureToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :show_group_join_feature, :boolean
  end
end
