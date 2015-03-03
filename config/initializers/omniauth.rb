Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
	# provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
	# provider :instagram, ENV['INSTAGRAM_KEY'], ENV['INSTAGRAM_SECRET']
	# provider :google_oauth2, ENV['GOOGLE_OAUTH2_KEY'], ENV['GOOGLE_OAUTH2_SECRET']
end