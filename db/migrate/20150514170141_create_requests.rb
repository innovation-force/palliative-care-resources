class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.string :req_type
      t.string :body
      t.string :parent_type
      t.string :parent_name
      t.string :user
      t.string :email
	  t.string :note
      t.boolean :resolved

      t.timestamps null: false
    end
  end
end
