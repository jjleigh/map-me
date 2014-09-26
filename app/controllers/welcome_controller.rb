class WelcomeController < ApplicationController
  
  def index
    if current_user && current_user.followers.present?
  		@markers = []
  		@followers = current_user.followers
  		# @followers.each do |f|
  		# 	marker_data = Follower.marker_data(f.user_name, f.location, f.name)
  		# 	@markers << [marker_data, f.latitude, f.longitude, f.avatar]
  		# end 
  	end 
  end

  def follower_data
  	client = Twitter::REST::Client.new do |config|
  		config.consumer_key = ENV['CONSUMER_KEY']
  		config.consumer_secret = ENV['CONSUMER_SECRET']
  		config.access_token = current_user.oauth_token
  		config.access_token_secret = current_user.oauth_secret  	
  	end
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
	  		Follower.follower_data(location_value, current_user.id, f)
	  	end
	  end
	  redirect_to root_path
  end
end
