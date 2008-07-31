class Activity < ActiveRecord::Base

	belongs_to :reference, :polymorphic => true
	belongs_to :user
	
	# returns formatted text for an activity item
	def formatted_text
		case self.text
			when "space_created"
				return "Space created, \'#{self.reference.name}\'"
			when "discussion_created"
				return "Discussion added, \'#{self.reference.subject}\'"
			when "comment_created"
				return "Comment added to \'#{self.reference.discussion.subject}\'"
		end
	end
	
	# returns a formatted body for an activity item
	def formatted_body
		case self.text
			when "space_created"
				return "Space created, \'#{self.reference.name}\'"
			when "discussion_created"
				return self.reference.body
			when "comment_created"
				return self.reference.body
		end		
	end

end
