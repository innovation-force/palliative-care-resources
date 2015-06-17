class ServicesController < ApplicationController
	before_action :authenticate_user!
	
	
	def index 
		@services = Service.joins(:provider).order(params[:sort]) 
		if (params[:sort]) == "comments" 
			counts = Service.includes(:comments).count('comments')
			@services = Service.order(counts)
		end 

	end 
	
	def show 
		@service = Service.find(params[:id])
	end 
	
	def new 
		@service = Service.new
	end 
	
	def edit 

		@service = Service.find(params[:id])
	end
	
	def create 
		@service = Service.new(service_params)
		
		if @service.save 
			redirect_to @service
		else 
			render 'new' 
		end 
	end

	def update 
		@service = Service.find(params[:id])
		
		if @service.update(service_params)
			redirect_to @service 
		else 
			render 'edit' 
		end 
	end 
	
	def destroy 
		@service = Service.find(params[:id])
		@service.destroy
		
		redirect_to services_path
	end
	
	def get_all_providers 
		@providers = Providers.find(:all, :order => 'name')
	end 
	
	private
		def service_params 
			params.require(:service).permit(:title, :description, :refcount, :provider_id, :category_ids => [])
		end 
end
