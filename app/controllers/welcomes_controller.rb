class WelcomesController < ApplicationController

	def new
		@welcome = Userdb.new
	end
	def create
		@welcome = Userdb.create(welcome_params)
		
	end
	private 
	def welcome_params
		params.require(:welcome).permit(:usermail, :password)
	end
end
