class CreateCategoriesConcerns < ActiveRecord::Migration
  def change
    create_table :categories_concerns do |t|
      t.references :category, index: true, foreign_key: true
      t.references :concern, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
