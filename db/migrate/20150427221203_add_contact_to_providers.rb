class AddContactToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :contact, :string
  end
end
