class BrowseController < ApplicationController
  def category
	@concern = Concern.find(params[:concern])
  end

  def concern
  
  end

  def service
	@category = Category.find(params[:category])
  end

  def servprovider
	@provider = Provider.find(params[:provider])
  end
end
