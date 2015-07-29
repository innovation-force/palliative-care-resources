class Admin::ProvidersController < Admin::ApplicationController
  def index
    @providers = Provider.where(nil)
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new

    if @provider.update(provider_params)
      redirect_to admin_providers_path
    else
      render 'new'
    end
  end

  def edit
    @provider = Provider.find(params[:id])
  end

  def update
    @provider = Provider.find(params[:id])

    if @provider.update(provider_params)
      redirect_to admin_providers_path
    else
      render 'edit'
    end
  end

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy

    redirect_to admin_providers_path
  end

  private

  def provider_params
    params.require(:provider).permit(:name, :organization, :phone, :website, :contact, :address1, :address2, :city, :state, :zip)
  end
end
