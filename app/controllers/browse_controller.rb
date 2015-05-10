class BrowseController < ApplicationController
  def category
	@concern = Concern.find(params[:concern])
	@category = Category.all
  end

  def concern
	if params[:search]
		@concern = Concern.find(:all, :conditions => ['name LIKE ?', "%#{params}[:search]}%"])
	else 
		@concern = Concern.all
	end
  end

  def service	
	@service = Service.all
	@category = Category.find(params[:category])
	@concern = Concern.find(params[:concern])
	
  end

  def servprovider
	Rails.logger.info "#" * 80
	Rails.logger.info params.inspect

	@concern = Concern.find(params[:concern])
	@category = Category.find(params[:category])
	@service = Service.find(params[:service])
	@provider = Provider.find(params[:provider])
  end
  
  
end
