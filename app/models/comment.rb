class Comment < ActiveRecord::Base

	belongs_to :discussion
	belongs_to :user

	def before_validation_on_create
		self.answer = 0
	end
	
end
