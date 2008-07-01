class DiscussionController < ApplicationController

	layout "default"
	before_filter :login_required

	def view
		@discussion = Discussion.find(params[:id])
	end

end
