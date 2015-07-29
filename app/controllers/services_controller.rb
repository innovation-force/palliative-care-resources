class ServicesController < ApplicationController
  def index
    @services = Service.includes(:provider).where(nil)
    @services = Service.find_by_categories(params[:category_ids]) if params[:category_ids].present?
  end

  def show
    @service = Service.find(params[:id])
  end
end
