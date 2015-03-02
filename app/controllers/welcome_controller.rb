class WelcomeController < ApplicationController
  
  def index
    if current_user && current_user.followers.present?
      gon.markers = []
      gon.followers = current_user.followers.limit(200)
  		gon.followers.each do |f|
  			gon.markers << [f.user_name, f.location, f.name, f.latitude, f.longitude, f.avatar]
  		end 
  	end 
  end
end
