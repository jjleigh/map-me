class User < ActiveRecord::Base
	 has_many :followers
	# def self.from_omniauth(auth)
 #    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
 #  end
	def self.create_with_omniauth(auth)
		location = auth['info']['location'] || ''
		user_location = Geocoder.coordinates(location)
		create! do |user|
			user.provider = auth['provider']
			user.uid = auth['uid'] 
			user.name = auth['info']['name'] || ''
			user.address = auth['info']['location'] || ''
			user.avatar = auth["info"]["image"] || ''
			user.oauth_token = auth["credentials"]["token"] || ''
			user.oauth_secret = auth["credentials"]["secret"] || ''
			user.save!
		end
	end

	def twitter_client
  	@client = Twitter::REST::Client.new do |config|
  		config.consumer_key = ENV['CONSUMER_KEY']
  		config.consumer_secret = ENV['CONSUMER_SECRET']
  		config.access_token = self.oauth_token
  		config.access_token_secret = self.oauth_secret  	
  	end		
	end

	def get_twitter_followers
  	client = self.twitter_client
  	# client = Facebook::REST::Client.new do |config|
  	# 	config.facebook_key = ENV['facebook_key']
  	# 	config.facebook_secret = ENV['facebook_secret']
  	# 	config.access_token = current_user.oauth_token
  	# 	config.access_token_secret = current_user.oauth_secret  	
  	# end
  	# client = Instagram::REST::Client.new do |config|
  	# 	config.instagram_key = ENV['instagram_key']
  	# 	config.instagram_secret = ENV['instagram_secret']
  	# 	config.access_token = current_user.oauth_token
  	# 	config.access_token_secret = current_user.oauth_secret  	
  	# end
  	# client = Google_oauth2::REST::Client.new do |config|
  	# 	config.google_plus_key = ENV['google_plus_key']
  	# 	config.google_plus_secret = ENV['google_plus_secret']
  	# 	config.access_token = current_user.oauth_token
  	# 	config.access_token_secret = current_user.oauth_secret  	
  	# end
  	@followers = client.followers.take(70)
  	@followers.each do |f|
  		location = f.location
  		location_value = Geocoder.coordinates(location)
	  	if location_value.present?
	  		Follower.follower_data(location_value, self.id, f)
	  	end
	  end
	end

end
