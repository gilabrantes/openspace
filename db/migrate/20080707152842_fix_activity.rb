class FixActivity < ActiveRecord::Migration
  def self.up
		execute("UPDATE activities SET text = 'comment_created' WHERE reference_type = 'Comment'")
		execute("UPDATE activities SET text = 'space_created' WHERE reference_type = 'Space'")
		execute("UPDATE activities SET text = 'discussion_created' WHERE reference_type = 'Discussion'")
  end

  def self.down
		# nothing here
  end
end
