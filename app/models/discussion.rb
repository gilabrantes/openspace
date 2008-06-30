class Discussion < ActiveRecord::Base

	belongs_to :space
	belongs_to :user
	
	validates_presence_of :subject, :body, :kind
	
	def validate
		# can't be answered when not a question
		if kind == 0 and answered == 1
			self.errors.add(answered, "can't be true when not a question")
		end
	end

end
