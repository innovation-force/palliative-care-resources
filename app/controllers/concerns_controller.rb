class ConcernsController < ApplicationController
	before_action :authenticate_user!, :except => [:index] 
	
	def index 
		@concerns = Concern.order(params[:sort])
	end 
	
	def show 
		@concern = Concern.find(params[:id])
	end 
	
	def new 
		@concern = Concern.new
	end 
	
	def edit 
		@concern = Concern.find(params[:id])
	end
	
	def create 
		@concern = Concern.new(concern_params)
		
		if @concern.save 
			redirect_to @concern
		else 
			render 'new' 
		end 
	end

	def update 
		@concern = Concern.find(params[:id])
		
		if @concern.update(concern_params)
			redirect_to @concern 
		else 
			render 'edit' 
		end 
	end 
	
	def destroy 
		@concern = Concern.find(params[:id])
		@concern.destroy
		
		redirect_to concerns_path
	end
	
	def get_all_categories 
		@categories = Category.find(:all, :order => 'name')
	end 
	
	private 
		def concern_params 
			params.require(:concern).permit(:name, :description, :diagnosis, :category_ids => [])
		end 
end
