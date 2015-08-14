class BooksController < ApplicationController

before_action :authenticate_user!,  :except => [:search,:live_search]

	def index
		@user = current_user
		@books = Book.all
	end

	def search
		@user = current_user
		@books = Book.where("title LIKE ? OR author LIKE ?" ,"%#{params[:book][:search]}%","%#{params[:book][:search]}%")
    	render 'index'
  	end
	

	def create 
		@user = current_user
		@book = Book.create(book_params)
		check_if_admin
		flash[:success] = "Book successfully added"
		redirect_to books_path(id: @user.id)
	end

	def book_params
		params.require(:book).permit(:title, :author, :price)
	end

	def add_books_to_user
		if request.post? 

			activated_ids = params[:activated].map(&:to_i).compact.uniq if params[:activated].present? 
		 	userid = params[:user_id]

			if activated_ids 
			 	activated_ids.each do |id| 
			 	book = Book.find_by_id(id) 

			 	ActiveRecord::Base.transaction do
					 	activity_record = Activity.create({:user_name => current_user.email, :book_name => book.title, :taken => true, :user_id => current_user.id})
					 	book.update_attributes!(user_id: userid.to_i)
					 end
			 	flash[:success] = "Book(s) added to your bag successfully"
			 	end 
			
		 	end
		end
		redirect_to books_path(id: userid)
	end

	def live_search
		@user = current_user
		if params[:search].present?
			@books = Book.search(params[:search])
		else
			@books = Book.all
		end

		respond_to do |format|
			format.html
			format.json {render json: @books}
			format.js
		end

	end

	def show 
		@user = current_user
		@books = Book.all
	end

	def remove_books
			@user = current_user
			check_if_admin
			activated_ids = params[:activated].map(&:to_i).compact.uniq if params[:activated].present? 
		 
			if activated_ids 
			 	activated_ids.each do |id| 
				 	book = Book.find_by_id(id) 
				 	book.destroy
			 	end 
			flash[:success] = "Successfully removed"
		 	end

		 	redirect_to books_path(id: userid)
	end

	end
