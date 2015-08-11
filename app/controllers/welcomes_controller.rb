class WelcomesController < ApplicationController
	skip_before_action :logged_in_user
	def new
		@welcome = Userdb.new
	end
	def create
		@welcome = Userdb.create(welcome_params)
		render 'new'
		
	end
	private 
	def welcome_params
		params.require(:welcome).permit(:usermail, :password, :age, :mobile, :address)
	end
end
