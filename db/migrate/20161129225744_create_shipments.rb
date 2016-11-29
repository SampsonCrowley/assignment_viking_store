class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.integer :orderid
      t.string :status
      t.date :date

      t.timestamps
    end
  end
end
