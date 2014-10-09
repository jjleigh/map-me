require 'faker'

FactoryGirl.define do
	factory :follower do
		name {Faker::Name.name}
	end
end