require 'rails_helper'

describe User do 

	# association tests

	it "should have many followers" do 
		expect(build(:user)).to respond_to(:followers)
	end

end