class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :userid, :null=>false
      t.integer :transaction_id, :null=>false

      t.timestamps
    end
  end
end
