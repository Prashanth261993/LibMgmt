class AdminController < ApplicationController
	before_action :authenticate_userdb!


	def show
		@user = current_userdb
		raise "not authorized" unless AdminPolicy.new(@user).is_admin?
		
		@activities_all = Activity.all
		@activities_today = @activities_all.select { |a| (Time.now.to_date - a.updated_at.to_date).to_i ==0  }	
		@activities_yest = @activities_all.select { |a| (Time.now.to_date - a.updated_at.to_date).to_i ==1  }	
		@activities_dayb4 = @activities_all.select { |a| (Time.now.to_date - a.updated_at.to_date).to_i ==2  }	
	end


	def book_show
		@user = current_userdb
		@books = Book.all
		
	end


	def book_add
		@user = current_userdb
		@book = Book.create(book_params)
		check_if_admin
		flash[:success] = "Book successfully added"
		redirect_to book_show_admin_path(id: @user.id)
	end


	def book_params
		params.require(:book).permit(:title, :author, :price)
	end


	def book_remove
			@user = current_userdb
			check_if_admin
			activated_ids = params[:activated].collect {|id| id.to_i} if params[:activated] 
		 
			if activated_ids 
			 	activated_ids.each do |id| 
				 	book = Book.find_by_id(id) 
				 	book.destroy
			 	end 
			flash[:success] = "Successfully removed"
		 	end

		 	redirect_to book_show_admin_path(id: @user.id)
	end


	def book_search
		@user = current_userdb
		@books = Book.where("title LIKE ? OR author LIKE ?" ,"%#{params[:book][:search]}%","%#{params[:book][:search]}%")
		render 'book_show'
   	end

   	def user_show
   		@user = current_userdb
   		@users = Userdb.all
   		render 'user'
   	end

   	def user_remove
   		@user = current_userdb
   		check_if_admin
   		remove_user = Userdb.find(params[:userdb_id].to_i)
   		books_available = remove_user.books
   		
   		if books_available.size > 0
   			flash[:error] = "User has books and therfore cannot be deleted"
   		else
   			flash[:success] = "User removed successfully"
	   		remove_user.destroy
   		end

   		redirect_to user_show_admin_path(id: @user.id)
		 	
   	end 

   	def user_search
   		@user = current_userdb
   		@users = Userdb.where("usermail LIKE ?" ,"%#{params[:user][:search]}%")
		render 'user'
   	end

   	def user_add
   		@user = current_userdb
   		check_if_admin
   		@new_user = Userdb.create(user_params)
   		flash[:success] = "User added successfully"
   		redirect_to user_show_admin_path(id: @user.id)
   	end

   	def user_params
   		params.require(:admin).permit(:usermail, :password, :age, :mobile, :address, :usertype)
   	end

   	def user_post
   		@user = current_userdb
   	end
end
