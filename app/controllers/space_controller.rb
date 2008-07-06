class SpaceController < ApplicationController

	layout "default"
	before_filter :login_required

	def index
		@spaces = Space.find(:all, :conditions => ["parent_id is NULL"])
	end

	def view
		@space = Space.find_by_alias(params[:id])
	end

	def new
		if request.post?
			@space = Space.new(params[:space])

			if @space.save
				create_activity("New space created - #{@space.name}", @space)
				flash[:success] = "Space created!"
				redirect_to :action => :view, :id => @space.alias
			else
				flash[:error] = "Error saving space"
			end
		end
	end
	
	def admin
		@space = Space.find_by_alias(params[:id])
		
		if request.post?
			if @space.update_attributes(params[:space])
				flash[:success] = "Space updated"
				redirect_to :action => "admin", :id => @space.alias
			else
				flash[:error] = "Error updating this space"
			end
		end
	end

end
