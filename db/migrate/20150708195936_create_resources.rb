class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :website
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
