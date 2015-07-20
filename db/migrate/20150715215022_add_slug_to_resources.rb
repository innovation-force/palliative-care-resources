class AddSlugToResources < ActiveRecord::Migration
  def change
    add_column :resources, :slug, :string
  end
end
