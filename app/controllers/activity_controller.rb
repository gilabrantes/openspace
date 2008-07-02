class ActivityController < ApplicationController

	layout "default"
	before_filter :login_required
	
	def index
		@activities = Activity.find(:all, :order => "created_at DESC")
	end
	
end
