class Follower < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

	def self.store_follower_data(location_value, user_id, follower)
		self.create_with(
			name: follower.name,
			avatar: follower.profile_image_url.to_s,
			location: follower.location,
			latitude: location_value.first,
			longitude: location_value.second,
			user_id: user_id
		).find_or_create_by(user_name: follower.user_name, user_id: user_id)
	end
end
