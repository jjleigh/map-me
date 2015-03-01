Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
	provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
	provider :instagram, ENV['INSTAGRAM_KEY'], ENV['INSTAGRAM_SECRET']
	provider :google_oauth2, ENV['GOOGLE_PLUS_KEY'], ENV['GOOGLE_PLUS_SECRET']
end