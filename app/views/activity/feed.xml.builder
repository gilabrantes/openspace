xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Openspace"
    xml.description "Openspace activity feed"
    xml.link "http://" + request.host + url_for(:controller => "space")

    for activity in @activities
      xml.item do
        xml.title activity.text
        xml.pubDate activity.created_at.to_s(:rfc822)
        xml.description activity.reference.body

				case activity.reference.class.to_s
					when "Discussion"
						xml.link discussion_url(activity.reference.id)
						xml.guid discussion_url(activity.reference.id)
					when "Comment"
						xml.link discussion_url(activity.reference.discussion.id)
						xml.guid discussion_url(activity.reference.id) + "#comment_#{activity.reference.id}"
				end
      end
    end
  end
end