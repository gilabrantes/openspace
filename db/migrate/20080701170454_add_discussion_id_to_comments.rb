class AddDiscussionIdToComments < ActiveRecord::Migration
	def self.up
		add_column :comments, :discussion_id, :integer
	end

	def self.down
		remove_column :comments, :discussion_id
	end
end
