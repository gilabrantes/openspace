class Activity < ActiveRecord::Base

	belongs_to :reference, :polymorphic => true

end
