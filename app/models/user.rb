class User < ActiveRecord::Base
	has_many :followers, dependent: :destroy

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

  def auth_client
    if provider == "twitter"
      @client = Twitter::REST::Client.new do |config|
        configure_tokens(config)    
      end 
    end        
  end

  def configure_tokens(config)
    config.consumer_key = ENV["#{provider.upcase}_KEY"]
    config.consumer_secret = ENV["#{provider.upcase}_SECRET"]
    config.access_token = self.oauth_token
    config.access_token_secret = self.oauth_secret
  end

  def get_followers
    client = self.auth_client
    @followers = client.followers.take(200)
    @followers.each do |f|
    location = f.location
    location_value = Geocoder.coordinates(location)
      if location_value.present?
       Follower.store_follower_data(location_value, self.id, f)
      end
    end
  end
end
