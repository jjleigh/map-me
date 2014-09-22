class Follower < ActiveRecord::Base
	belongs_to :user

	def self.follower_data(location_value, user_id, follower,)
		self.create_with(
			name: follower.name,
			avatar: follower.profile_image_url,
			location: follower.location,
			latitude: location_value.first
			longitude: location_value.second
			user_id: user_id
			).find_or_create_by(user_name: follower.user_name, user_id: user_id)
		
	end

	def self.marker_data(name, location, user_name)
		"<span class='friend-info'><strong>@#{screen_name}</strong><br>#{name}<br>#{location}<span>"
		
	end
end
