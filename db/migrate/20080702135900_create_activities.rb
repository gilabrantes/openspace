class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
			t.string :text
			t.integer :user_id
			t.references :reference, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
