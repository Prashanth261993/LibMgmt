class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    include SessionsHelper 
  protect_from_forgery with: :exception
  before_action :logged_in_user

  	def correct_user
		#@Currentuser = Userdb.find(session[:user_id].to_i)
		if session[:user_id].to_i != params[:id].to_i
			flash[:Access] = "Illegal access"
			redirect_to controller: :users, action: :show, id: session[:user_id]
		end
		#redirect_to controller: :users, action: :show, id: session[:user_id]
	end

	def log_in(user) 
	session[:user_id] = user.id 
	end
  	
  	def logged_in_user

		unless logged_in?
			flash[:message] = "Not logged in"
			redirect_to root_url
		end

	end

	def current_user 
		@current_user ||= Userdb.find_by(id: session[:user_id]) 
	end # Returns true if the user is logged in, false otherwise. 

	def logged_in? 
		!current_user.nil? 
	end


end
