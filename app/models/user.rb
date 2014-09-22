class User < ActiveRecord::Base
	 has_many :followers
	# def self.from_omniauth(auth)
 #    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
 #  end
	def self.create_with_omniauth(auth)
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
end
