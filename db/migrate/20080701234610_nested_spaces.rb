class NestedSpaces < ActiveRecord::Migration
  def self.up
    add_column :spaces, :parent_id, :integer
  end

  def self.down
    remove_column :spaces, :parent_id
  end
end
