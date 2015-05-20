class ChangeColumnDefault < ActiveRecord::Migration
  def change
	change_column_default(:services, :refcount, 0)
  end
end
