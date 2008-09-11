class ActivityController < ApplicationController

	layout "default", :except => "feed"
	before_filter :login_required, :except => "feed"
	before_filter :hash_required, :only => "feed"
	
	def index
		@activities = Activity.find(:all, :order => "created_at DESC", :limit => "40")
	end

	def feed
		@activities = Activity.find(:all, :order => "created_at DESC", :limit => "20")
	end
		
end
