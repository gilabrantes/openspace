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
		
		@comment.discussion.answered = true
		@comment.discussion.save
		
		current_user.addpoints(4) # gives 4 points

		render :update do |page|
			page.replace_html 'message', "Marked as answer"
			page.replace "comment_#{@comment.id}", :partial => "discussion/comment", :object => @comment
		end
	end

	def unmark_as_answer
		@comment = Comment.find(params[:id])
		@comment.answer = false
		@comment.save

		current_user.subpoints(4) # removes 4 points

		render :update do |page|
			page.replace_html "message", "Removed answer flag"
			page.replace "comment_#{@comment.id}", :partial => "discussion/comment", :object => @comment
		end
	end

end
