class Space < ActiveRecord::Base

	acts_as_tree

	has_many :discussions, :include => [:user], :order => "created_at DESC"
	has_many :activities, :as => :reference

	validates_presence_of :name, :alias

end
