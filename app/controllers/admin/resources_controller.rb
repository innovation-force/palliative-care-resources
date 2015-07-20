class Admin::ResourcesController < Admin::ApplicationController
  def index
    @resources = Resource.where(nil)
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new

    if @resource.update(resource_params)
      redirect_to admin_resources_path
    else
      render 'new'
    end
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])

    if @resource.update(resource_params)
      redirect_to admin_resources_path
    else
      render 'edit'
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    redirect_to admin_resources_path
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :organization, :slug, :website, :phone_number, {:tag_ids => []}, :provider_id)
  end
end
