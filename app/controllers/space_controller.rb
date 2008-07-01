class SpaceController < ApplicationController

	layout "default"

	def view
		@space = Space.find_by_alias(params[:id])
		@discussions = @space.discussions
	end

end
