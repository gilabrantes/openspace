class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
			t.text :body
			t.column :answer, :integer, :size => 1
			t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
