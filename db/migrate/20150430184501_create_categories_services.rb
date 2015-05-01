class CreateCategoriesServices < ActiveRecord::Migration
  def change
    create_table :categories_services do |t|
		t.references :category, index: true, foreign_key: true
		t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
