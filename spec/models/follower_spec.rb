require 'rails_helper'


describe Follower do
	

	# association tests

	it "should belong to a user" do 
		expect(build(:follower)).to respond_to(:user)
	end

end