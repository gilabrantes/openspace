class Space < ActiveRecord::Base

	has_many :discussions

	validates_presence_of :name, :alias

end
