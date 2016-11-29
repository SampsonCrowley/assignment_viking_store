class CreateShipmentItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shipment_items do |t|
      t.integer :shipmentid, :null=>false
      t.integer :itemid, :null=>false

      t.timestamps
    end
  end
end
