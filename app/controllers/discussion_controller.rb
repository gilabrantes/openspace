class DiscussionController < ApplicationController

	layout "default"
	before_filter :login_required

	def view
		@discussion = Discussion.find(params[:id])
	end

	def new
		if request.post?
			@discussion = Discussion.new(params[:discussion])
			current_user.discussions << @discussion
			# discussion.space = params[:space_id]

			if @discussion.save
				flash[:success] = "Discussion created!"
				redirect_to :action => :view, :id => @discussion.id
			else
				flash[:error] = "Error saving discussion"
			end
		end
	end

	def comment
		if request.post?
			@comment = Comment.new(params[:comment])
			current_user.comments << @comment

			if @comment.save
				flash[:success] = "Comment created!"
				redirect_to :action => :view, :id => @comment.discussion.id
			else
				flash[:error] = "Error saving comment"
			end
		end
	end
	
	# marks a given comment as answer
	# TODO move to model?
	def mark_as_answer
		@comment = Comment.find(params[:id])
		@comment.answer = true
		@comment.save
		
		# TODO give points to comment author
		render :update do |page|
			page.insert_html :top, 'sidebar', "Marked as answer"
		end
	end

end
