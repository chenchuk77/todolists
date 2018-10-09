class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  
  def new
  end

  def create
  	user = User.find_by(username: params[:user][:username])
  	password = params[:user][:password]
  	puts "********** #{user}"
  	puts "********** #{password}"
    if user && user.authenticate(password)
      puts "********** authenticated"
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      puts "********** rejected"
      redirect_to login_path, alert: "Invalid username/password"
    end
  end

  def destroy
  	reset_session # wipe out session
    redirect_to login_path, notice: "You have been logged out"
  end
end









