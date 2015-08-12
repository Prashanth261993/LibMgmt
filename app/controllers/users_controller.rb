class UsersController < ApplicationController
	before_action :authenticate_userdb!

	def edit
		#@user = Userdb.find(params[:id].to_i)
		@user = current_userdb
	end

	def show
	
		#@user = Userdb.find(params[:id].to_i)
		@user = current_userdb
		if @user.usertype == 2
			@books=@user.books
			@books.each do |b| 
				
				current_time = Time.now.getutc
				no_of_days = (current_time-b.updated_at).to_i/(24 * 60 *60)
				if b.userdb_id != 0
					b.due_date = (current_time + (15 - no_of_days).days).to_date
				end
			end

		else
			 redirect_to controller: :admin, action: :show, id: @user.id
		end

	end
	def delete
	end

	def remove_user_book
		book = Book.find(params[:book_id].to_i)
		book.update_attributes!(userdb_id: 0)
		activity_record = Activity.new
		activity_record.user_name = current_user.email
		activity_record.book_name = book.title
		activity_record.taken = false
		activity_record.userdb_id = current_user.id
		activity_record.save
        flash[:success] = 'Successfully removed!'
		redirect_to controller: :users, action: :show, id: params[:id]
	end
	def update
		@user = current_userdb
		if params[:user_update].present?
			if @user.update(update_params)
				flash[:success] = "Successfullly updated"
				#redirect_to controller: :users, action: :edit, id: params[:id]
			else
				flash[:failure]
				#redirect_to controller: :users, action: :edit, id: params[:id]
			end
		end
		redirect_to controller: :users, action: :edit, id: params[:id]
	end
	def update_params
		params.require(:user_update).permit(:usermail,:age,:address,:mobile)	
	end
=begin	def due_date
		
		@books = Book.all
		@books.each do |b| 
			
			time = Time.now.getutc
			if b.userdb_id != 0
				b.due_date = "5"
			end
		end
	end
=end
end
