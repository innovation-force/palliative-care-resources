class UsersController < ApplicationController
	before_action :authenticate_user!
	
	def index 
		@users = User.where(:approved => false)
	end 
	
	def show 
		@users = User.where(:approved => false)
		render 'index'
		
	end 
	
	def edit 
		@user = User.find(params[:id])
	end
	
	
	def update 
		@user = User.find(params[:id])
		
		if @user.update(user_params)
			redirect_to @user 
		else 
			render 'edit' 
		end 
	end 
	
	def destroy 
		@user = User.find(params[:id])
		@user.destroy
		
		redirect_to users_path
	end
	

	private 
		def user_params 
			params.require(:user).permit(:approved)
		end 
end