class SessionsController < ApplicationController
    skip_before_action :logged_in_user
  def new
    
  end
  def create
  	user = Userdb.find_by(usermail: params[:session][:usermail])
  	if user && user["password"] == params[:session][:password]
      log_in user
  		redirect_to user_path(id: user.id)
  	else
  		redirect_to root_path
      flash[:failure] = "Wrong credentials"
  	end
  end

  def show
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
