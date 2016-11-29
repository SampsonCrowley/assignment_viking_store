class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :orderid, :null=>false
      t.string :title, :null=>false
      t.float :price, :null=>false
      t.integer :quantity, :null=>false
      t.float :discount
      t.float :tax, :null=>false

      t.timestamps
    end
  end
end
