# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def button(icon, text, url)
		image = image_tag("icons/" + icon, :class => "va") if !icon.nil?
		return link_to image + " " + text, url, :class => "button"
	end

	def d_icon(discussion)
		if discussion.kind == 1
			return image_tag("icons/question.png", :class => "va")
		else
			return image_tag("icons/discussion.png", :class => "va")
		end
	end

	def d_back(discussion)
		out = link_to("Spaces", :controller => "space") + " &gt; " + link_to(discussion.space.name, space_url(:id => discussion.space.alias)) + " &gt; " + link_to(discussion.subject, discussion_url(:id => discussion.id))
	end
	
	def d_kind(discussion, downcase = false)
		if discussion.kind == 0
			return "discussion" if downcase
			return "Discussion"
		else
			return "question" if downcase
			return "Question"
		end
	end
	
	def s_back(space)
		return link_to("Spaces", :action => "index") + " &gt; " + link_to (@space.name, space_url(@space.alias))
	end

end
