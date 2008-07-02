class ActivityController < ApplicationController

	layout "default", :except => "feed"
	before_filter :login_required, :except => "feed"
	
	def index
		@activities = Activity.find(:all, :order => "created_at DESC")
	end

	def feed
		@activities = Activity.find(:all, :order => "created_at DESC")
	end
		
end
