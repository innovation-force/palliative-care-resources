class AddOrganizationToResources < ActiveRecord::Migration
  def change
    add_column :resources, :organization, :string
  end
end
