# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def d_icon(discussion)
		if discussion.kind == 1
			return image_tag("icons/question.png", :class => "va")
		else
			return image_tag("icons/discussion.png", :class => "va")
		end
	end


end
