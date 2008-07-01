class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :points, :integer, :default => 0
    add_column :users, :nickname, :string
  end

  def self.down
    remove_column :users, :points
    remove_column :users, :nickname
  end
end
