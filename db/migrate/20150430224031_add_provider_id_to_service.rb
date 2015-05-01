class AddProviderIdToService < ActiveRecord::Migration
  def change
    add_column :services, :provider_id, :integer
  end
end
