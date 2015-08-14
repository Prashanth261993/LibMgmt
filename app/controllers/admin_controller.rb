class AdminController < ApplicationController
	before_action :authenticate_user!


	def show
		@user = current_user
		check_if_admin
		@activities_all = Activity.all
		@activities_today = @activities_all.select { |a| (Time.now.to_date - a.updated_at.to_date).to_i ==0  }	
		@activities_yesterday = @activities_all.select { |a| (Time.now.to_date - a.updated_at.to_date).to_i ==1  }	
		@activities_daybefore = @activities_all.select { |a| (Time.now.to_date - a.updated_at.to_date).to_i ==2  }	
	end

   	def user_search
   		@user = current_user
   		@users = User.where("usermail LIKE ?" ,"%#{params[:user][:search]}%")
		render 'user'
   	end

   	def user_post
   		@user = current_user
   	end
end
