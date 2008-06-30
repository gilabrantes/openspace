require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Discussion do
  before(:each) do
    @valid_attributes = {
			:subject => "A test subject",
			:body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
			:kind => 0,
			:status => 1,
			:answered => 0
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