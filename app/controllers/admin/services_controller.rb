class Admin::ServicesController < Admin::ApplicationController
  def index
    @services = Service.includes(:provider).where(nil)
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new

    if @service.update(service_params)
      redirect_to admin_services_path
    else
      render 'new'
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])

    if @service.update(service_params)
      redirect_to admin_services_path
    else
      render 'edit'
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    redirect_to admin_services_path
  end

  private

  def service_params
    params.require(:service).permit(:title, :provider_id, :description, {:category_ids => []})
  end
end
