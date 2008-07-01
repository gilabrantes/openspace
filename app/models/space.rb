class Space < ActiveRecord::Base

	has_many :discussions, :include => [:user], :order => "created_at DESC"

	validates_presence_of :name, :alias

end
