class AddGroupsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :administrator, :boolean
    add_column :users, :enabled, :boolean
  end

  def self.down
    remove_column :users, :enabled
    remove_column :users, :administrator
  end
end
