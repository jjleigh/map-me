class SessionsController < ApplicationController
  def create
  	auth = request.env["omniauth.auth"]

      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
  session[:user_id] = user.id
  redirect_to root_url, :notice => "Signed in!"

		# auth = request.env['omniauth.auth']
		# user = User.find_by_email(params[:email])
		# if user && user.authenticate(params[:password])
		# else
		# 	flash.now[:alert] = "Invalid email or password"
		# 	render :new
		# end
  end

  def destroy
  	session[:user_id] = nil
		redirect_to root_url
  end
end
