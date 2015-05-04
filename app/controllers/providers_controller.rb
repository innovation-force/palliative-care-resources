class ProvidersController < ApplicationController
	def index 
		@providers = Provider.all 
	end 
	
	def show 
		@provider = Provider.find(params[:id])
	end 
	
	def new 
		@provider = Provider.new 		
		@provider.services.build
		@services = Service.all
	end 
	
	def edit 
		@provider = Provider.find(params[:id])
	end
	
	def create 
		@provider = Provider.new(provider_params)
		
		if @provider.save 
			redirect_to @provider
		else 
			render 'new' 
		end 
	end

	def update 
		@provider = Provider.find(params[:id])
		
		if @provider.update(provider_params)
			redirect_to @provider 
		else 
			render 'edit' 
		end 
	end 
	
	def destroy 
		@provider = Provider.find(params[:id])
		@provider.destroy
		
		redirect_to providers_path
	end
	
	def get_all_categories 
		@categories = Category.find(:all, :order => 'name')
	end 
	
	private 
		def provider_params 
			params.require(:provider).permit(:name, :organization, :address1, :address2, :city, :state, :zip, :phone, :website, :contact, :service_ids => [], services_attributes: [:id, :title, :description, :_destroy])
		end 
end
