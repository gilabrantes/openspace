class Comment < ActiveRecord::Base

	belongs_to :discussion
	belongs_to :user

	def before_validation_on_create
		self.answer = 0
	end
	
	def after_create
		activity = Activity.create(:user_id => self.user_id, :text => "New comment on #{self.discussion.subject}")
		activity.reference = self
		activity.save
	end
	
end
