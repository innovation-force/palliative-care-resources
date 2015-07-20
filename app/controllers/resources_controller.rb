class ResourcesController < ApplicationController
  def index
    @resources = Resource.where(nil)
    @resources = Resource.find_by_tags(params[:tag_ids]) if params[:tag_ids].present?
  end

  def show
    @resource = Resource.find(params[:id])
  end
end
