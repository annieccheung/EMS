class SessionController < ApplicationController

def new
	# @messages = flash.map {|key, value| "#{key.capitalize}: #{value}"}.join(";")
end

def create
  @user = User.authenticate(params[:user][:email], params[:user][:password])

  if @user
  	session[:user_id] = @user.id
  	# render text: "Youz logged in"
  	redirect_to root_url
  else 
  	flash.now[:alert] = "Unable to log you in. Please check your email and password and try again."
  	render :new
  end 
  
end

def destroy
  session[:user_id] = nil	
  redirect_to login_url, notice: "You've successfully logged out!"
end

end
