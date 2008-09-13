class Comment < ActiveRecord::Base

	belongs_to :discussion
	belongs_to :user
	

	def before_validation_on_create
		self.answer = 0
	end
	
	def after_create
		Activity.create(:user_id => self.user_id, :text => "comment_created", :reference => self)
		User.find(self.user_id).addpoints(1) # gives the user 1 point for the reply
	end
	
end
