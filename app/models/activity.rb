class Activity < ActiveRecord::Base

	belongs_to :reference, :polymorphic => true
	belongs_to :user

end
