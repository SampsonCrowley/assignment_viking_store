class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :userid, :null=>false
      t.boolean :default
      t.integer :last_four, :null=>false
      t.string :nickname
      t.string :merchant_id, :null=>false
      t.string :merchant_card_id, :null=>false

      t.timestamps
    end
  end
end
