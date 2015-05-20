class AddRefcountToServices < ActiveRecord::Migration
  def change
    add_column :services, :refcount, :integer
  end
end
