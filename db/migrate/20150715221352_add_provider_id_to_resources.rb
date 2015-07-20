class AddProviderIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :provider_id, :integer
  end
end
