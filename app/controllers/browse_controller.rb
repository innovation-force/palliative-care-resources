class BrowseController < ApplicationController

	def category
		@concern = Concern.find(params[:concern])
		@category = Category.all
	end

	def concern
		@concern = Concern.all
		@count = 0
	end 

	def service	
		if params[:filter]
			@category = Category.find(params[:category])
			@concern = Concern.find(params[:concern])
			
			@cities = Service.joins(:provider).select(:city).distinct
			@states = Service.joins(:provider).select(:state).distinct
			@category_services = @category.services
			
			@wildcard = params[:filter]
			@wildcard.insert(0, '%')
			@wildcard.insert(-1, '%')
			
			@filter_services = Service.joins(:provider).where(["providers.state ILIKE ? OR providers.city ILIKE ?",  @wildcard, @wildcard])
			
			@services = @category_services & @filter_services 
	
		else 
			
			@category = Category.find(params[:category])
			@concern = Concern.find(params[:concern])
			@services = @category.services
			
			@cities = Service.joins(:provider).select(:city).distinct
			
			@states = Service.joins(:provider).select(:state).distinct
		end
		
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
			
			@services = Service.joins(:provider).where(["title ILIKE ? OR description ILIKE ? OR providers.name ILIKE ? OR providers.organization ILIKE ? OR providers.city ILIKE ? OR providers.state ILIKE ?",  @wildcard, @wildcard, @wildcard, @wildcard, @wildcard, @wildcard])
			
			
		else
			@providers = Provider.all 
			@services = Service.all
		end
	end 

  
end

