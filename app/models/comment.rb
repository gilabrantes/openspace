class Comment < ActiveRecord::Base

	belongs_to :discussion
	belongs_to :user
	

	def before_validation_on_create
		self.answer = 0
	end
	
	def after_create
		Activity.create(:user_id => self.user_id, :text => "comment_created", :reference => self)
	end
	
end
