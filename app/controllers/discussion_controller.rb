class DiscussionController < ApplicationController

	layout "default"
	before_filter :login_required

	def view
		@discussion = Discussion.find(params[:id])
	end

	def new
		if request.post?
				#create a comment
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
	
	def update
		@discussion = Discussion.find(params[:id])
		
		if @discussion.safe_update(params[:discussion])
			flash[:success] = "Discussion updated!"
			redirect_to :action => :view, :id => @discussion.id
		else
			flash[:error] = "Error saving discussion"
		end
		
	end

	def comment
		if request.post?
			unless params[:id]
				#create a new comment
				@comment = Comment.new(params[:comment])
				@comment.user = current_user
			else
				#edit a comment
				@comment = Comment.find_by_id_and_user_id params[:id], current_user.id
				@comment.attributes= params[:comment]
			end
			
			if @comment.save
				flash[:success] = "Comment saved!"
				redirect_to :action => :view, :id => @comment.discussion.id
			else
				flash[:error] = "Error saving comment"
			end
		end
	end
	
	def edit
		@discussion = Discussion.find(params[:id])
		raise ActiveRecord::RecordNotFound unless @discussion
		render :update do |page|
			page.hide 'response'
			page.replace_html "discussion_text", :partial => 'discussion_edit_form'
		end
		
	end
	
	def edit_comment
		@comment = Comment.find_by_id_and_user_id params[:id],current_user.id
		raise ActiveRecord::RecordNotFound unless @comment
		@discussion = @comment.discussion
		render :update do |page|
			page.hide 'response'
			page.replace_html "comment_#{@comment.id}", :partial => 'comment_form'
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
		@comment.user.addpoints(4) # gives 4 points
		render :update do |page|
			page.replace_html 'message', "Marked as answer"
			page.replace "comment_#{@comment.id}", :partial => "discussion/comment", :object => @comment
		end
	end

	# # marks a given comment as spam
	# # TODO move to model?	
	# def mark_as_spam
	# 	@comment = Comment.find(params[:id])
	# 	@comment.spam = true
	# 	@comment.save
	# 	@comment.user.delpoints(4)
	# 	render :update do |page|
	# 		page.replace_html 'message', "Marked as spam"
	# 		page.replace "comment_#{@comment.id}", :partial => "discussion/comment", :object => @comment
	# 	end
	# end

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
