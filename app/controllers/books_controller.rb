class BooksController < ApplicationController

before_action :authenticate_userdb!,  :except => [:search,:live_search]

	def index
		#@user = Userdb.find(params[:id].to_i)
		@user = current_userdb
		@books = Book.all
	end

	def search
		
		#@user = Userdb.find(session[:user_id].to_i)
		@user = current_userdb
		@books = Book.where("title LIKE ? OR author LIKE ?" ,"%#{params[:book][:search]}%","%#{params[:book][:search]}%")
		
		#@books = Book.where("title LIKE %#{params[:book][:search]}% OR author LIKE %#{params[:book][:search]}%.to_s" )
    	#render 'index'
    	#render json: @books
    	render 'index'
  	end
	

	def create 
		if request.post? 

			activated_ids = params[:activated].collect {|id| id.to_i} if params[:activated] 
		 #seen_ids = params[:seen].collect {|id| id.to_i} if params[:seen] 
		 	userid = params[:userdb_id]

			if activated_ids 
			 	activated_ids.each do |id| 
			 	book = Book.find_by_id(id) 
			 	activity_record = Activity.new
			 	activity_record.user_name = current_userdb.email
				activity_record.book_name = book.title
				activity_record.taken = true
				activity_record.userdb_id = userid
				activity_record.save
			 	book.update_attributes!(userdb_id: userid.to_i)
			 	flash[:success] = "Book(s) added to your bag successfully"
			 	end 
			
		 	end
		end
		redirect_to books_path(id: userid)
	end

	def live_search
		#binding.pry
		@user = current_userdb
		#@books = Book.all
		#if @books.size != 
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
		@user = current_userdb
		@books = Book.all
	end



	end
