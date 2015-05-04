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
	@concern = Concern.find(params[:concern])
	@category = Category.find(params[:category])
	@service = Service.find(params[:service])
	@provider = Provider.find(params[:provider])
  end
end
