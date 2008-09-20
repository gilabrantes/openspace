class Discussion < ActiveRecord::Base

	belongs_to :space
	belongs_to :user
	has_many :comments
	has_one :activity, :as => :reference
	#has_many :tags, :as => :taggable

	validates_presence_of :subject, :body, :kind, :space_id, :user_id

	def validate
		# can't be answered when not a question
		if kind == 0 and answered == 1
			self.errors.add(answered, "can't be true when not a question")
		end
	end

	def before_create
		self.answered = 0
	end

	def before_validation_on_create
		self.status = 1
	end

	def after_create
		Activity.create(:user_id => self.user_id, :text => "discussion_created", :reference => self)
		User.find(self.user_id).addpoints(2) # gives the user 2 points for starting a topic
	end
	
	def safe_update(params)
		self.update_attribute(:body, params[:body]) unless params[:body].blank?
	end

end
