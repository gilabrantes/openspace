require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Discussion do
  
  fixtures :users
	
  before(:each) do
    @valid_attributes = {
			:subject => "A test subject",
			:body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
			:kind => 0,
			:status => 1,
			:answered => 0, 
			:space_id => 1,
			:user => users(:jack)
    }
  end

  it "should create a new instance given valid attributes" do
    Discussion.create!(@valid_attributes)
  end

	it "should have a subject" do
	  @discussion = Discussion.new(@valid_attributes)
		@discussion.subject = nil
		@discussion.save.should be_false
	end
	
	it "should have a body" do
	  @discussion = Discussion.new(@valid_attributes)
		@discussion.body = nil
		@discussion.save.should be_false
	end
	
	it "should have a defined type" do
	  @discussion = Discussion.new(@valid_attributes)
		@discussion.kind = nil
		@discussion.save.should be_false
	end
	
	it "should not be answered if not a question" do
	  @discussion = Discussion.new(@valid_attributes)
		@discussion.answered = 1
		@discussion.save.should be_false
	end
	
	it "should belong to a space" do
	  @discussion = Discussion.new(@valid_attributes)
		@discussion.space_id = nil
		@discussion.save.should be_false
	end
	
	it "should only update body when edited" do
		
		
		#This may well be the ugliest spec i've ever writen! :(
		new_attributes = {:subject => "CHANGED!", :body => "CHANGED!", :kind => 99, :status => 0, :answered => 1, :space_id => -1}
		
	  	@discussion = Discussion.create(@valid_attributes)
		@discussion.user = users(:jack)
		@discussion.safe_update(new_attributes)
		updated_attributes = @discussion.attributes
		updated_attributes.delete("body")
		updated_attributes.delete("updated_at")
		updated_attributes.delete("created_at")
		updated_attributes.delete("id")
		updated_attributes.delete("user_id")
		initial_attributes = @valid_attributes
		initial_attributes.delete(:body)
		initial_attributes.delete(:user)
		
		initial_attributes.each_key do |key|
			initial_attributes[key].should eql(updated_attributes[key.to_s])
		end
		
	end
end

describe Discussion, "marked as a question" do
  before(:each) do
    @valid_attributes = {
			:subject => "A test question",
			:body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
			:kind => 1,
			:status => 1,
			:answered => 0
    }
  end
	
end