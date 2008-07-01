class AddSpaceToDiscussions < ActiveRecord::Migration
  def self.up
    add_column :discussions, :space_id, :integer
  end

  def self.down
    remove_column :discussions, :space_id
  end
end
