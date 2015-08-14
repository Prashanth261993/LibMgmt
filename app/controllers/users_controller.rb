class UsersController < ApplicationController
	before_action :authenticate_user!


	def edit
		@user = current_user
	end



	def create
		@user = current_user
   		check_if_admin
   		@new_user = User.create(user_params)
   		flash[:success] = "User added successfully"
   		redirect_to user_show_admin_path(id: @user.id)
	end


	def user_params
   		params.require(:admin).permit(:usermail, :password, :age, :mobile, :address, :usertype)
   	end


	def index
		@user = current_user
   		@users = User.all

	end


	def show

		@user = current_user
		if 2 == @user.usertype
			@books = @user.books
			@books.each do |b| 
				
				current_time = Time.now.getutc
				num_days = (current_time-b.updated_at).to_i/(24 * 60 *60)
				if  0 != b.user_id 
					b.due_date = (b.updated_at).to_date + 15
				end
			end

		else
			 redirect_to controller: :admin, action: :show, id: @user.id
		end

	end

	

	def destroy

		@user = current_user
   		check_if_admin
   		user_to_be_removed = User.find(params[:user_id].to_i)
   		books_available = user_to_be_removed.books
   		
   		if  0 < books_available.size
   			flash[:error] = "User has books and therfore cannot be deleted"
   		else
   			flash[:success] = "User removed successfully"
	   		user_to_be_removed.destroy
   		end

   		redirect_to users_path
	end



	def remove_user_book
		book = Book.find(params[:book_id].to_i)

		ActiveRecord::Base.transaction do
			book.update_attributes!(user_id: 0)
			activity_record = Activity.create({:user_name => current_user.email, :book_name => book.title, :taken => false, :user_id => current_user.id})
        end
        flash[:success] = 'Successfully removed!'
		redirect_to controller: :users, action: :show, id: params[:id]
	end





	def update
		@user = current_user
		if params[:user_update].present?
			if @user.update(update_params)
				flash[:success] = "Successfullly updated"
			
			else
				flash[:failure] = "There is no way this fails"

			end
		end
		redirect_to controller: :users, action: :edit, id: params[:id]
	end



	def update_params
		params.require(:user_update).permit(:usermail,:age,:address,:mobile)	
	end



	def remove_user_byadmin

	end

end
