class CreateDiscussions < ActiveRecord::Migration
  def self.up
    create_table :discussions do |t|
			t.string :subject
			t.text :body
			
			# kind
			# 0 - discussion
			# 1 - question
			t.column :kind, :integer, :size => 1
			
			# status
			# 0 - closed
			# 1 - open
			t.column :status, :integer, :size => 1
			
			# answered
			# 0 - no
			# 1 - yes
			t.column :answered, :integer, :size => 1
			
      t.timestamps
    end
  end

  def self.down
    drop_table :discussions
  end
end
