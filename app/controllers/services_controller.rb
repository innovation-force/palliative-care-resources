class ServicesController < ApplicationController
	def index 
		@services = Service.all 
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
			params.require(:service).permit(:title, :description, :provider_id, :category_ids => [])
		end 
end
