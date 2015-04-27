class CreateConcerns < ActiveRecord::Migration
  def change
    create_table :concerns do |t|
      t.string :name
      t.string :description
      t.boolean :diagnosis

      t.timestamps null: false
    end
  end
end
