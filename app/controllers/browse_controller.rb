class BrowseController < ApplicationController

	def category
		@concern = Concern.find(params[:concern])
		@category = Category.all
	end

	def concern
		@concern = Concern.all
	end

	def service	
		@service = Service.all
		@category = Category.find(params[:category])
		@concern = Concern.find(params[:concern])

	end

	def servprovider
		@service = Service.find(params[:service])
		
		@provider = Provider.find(params[:provider])
		
		if params[:concern]
			@concern = Concern.find(params[:concern])
		end
		
		if params[:category]
			@category = Category.find(params[:category])
		end 
		
		
	end

	def search 
		if params[:search]
			@wildcard = params[:search]
			@wildcard.insert(0, '%')
			@wildcard.insert(-1, '%')
			
			@services = Service.joins(:provider).where(["title ILIKE ? OR description ILIKE ? OR providers.name ILIKE ? OR providers.organization ILIKE ? OR providers.city ILIKE ?",  @wildcard, @wildcard, @wildcard, @wildcard, @wildcard])
			
			
		else
			@providers = Provider.all 
			@services = Service.all
		end
	end 

  
end

