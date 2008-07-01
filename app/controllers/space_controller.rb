class SpaceController < ApplicationController

	layout "default"
	before_filter :login_required

	def index
		@spaces = Space.find(:all)
	end

	def view
		@space = Space.find_by_alias(params[:id])
		@discussions = @space.discussions
	end

end
