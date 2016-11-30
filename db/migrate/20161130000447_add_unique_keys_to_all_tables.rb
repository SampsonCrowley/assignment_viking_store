class AddUniqueKeysToAllTables < ActiveRecord::Migration[5.0]
  def change
    add_index :cards, :merchant_card_id, unique: true
    add_index :orders, :transaction_id, unique: true

    add_index :products, :sku, unique: true
    add_index :products, :title, unique: true
    add_index :categories, :description, unique: true

    add_index :states, :abbr, unique: true
    add_index :states, :full, unique: true

    add_index :users, :email, unique: true

    add_column :categories, :tag, :string, null: false, unique: true
  end
end
