require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Space do
  before(:each) do
    @valid_attributes = {
			:name => "Test space",
			:description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
			:alias => "test"
    }
  end

  it "should create a new instance given valid attributes" do
   	Space.create!(@valid_attributes)
  end

	it "should have a name and alias" do
	  @space = Space.new
		@space.save.should be_false
		@space.name = "Test"
		@space.save.should be_false
		@space.alias = "alias"
		@space.save.should be_true
	end
end
