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

end
