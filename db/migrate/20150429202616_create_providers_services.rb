class CreateProvidersServices < ActiveRecord::Migration
  def change
    create_table :providers_services do |t|
		t.references :provider, index: true, foreign_key: true
		t.references :service, index: true, foreign_key: true
		
		t.timestamps null: false
    end
  end
end

