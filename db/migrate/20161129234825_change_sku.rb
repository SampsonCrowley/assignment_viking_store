class ChangeSku < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :SKU, :sku
  end
end
