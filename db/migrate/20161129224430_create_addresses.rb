class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :userid, :null=>false
      t.boolean :shipping
      t.boolean :billing
      t.string :name
      t.string :company
      t.string :address, :null=>false
      t.string :address_2
      t.string :city, :null=>false
      t.integer :stateid, :null=>false
      t.string :zip, :null=>false

      t.timestamps
    end
  end
end
