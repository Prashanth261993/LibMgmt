class SessionsController < ApplicationController
  def new
  end
  def create
  	user = Userdb.find_by(usermail: params[:session][:usermail])
  	if user && user["password"] == params[:session][:password]
  		redirect_to "https://www.google.co.in/"
  	else
  		render 'new'
  	end
  end
end
