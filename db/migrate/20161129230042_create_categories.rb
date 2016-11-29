class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.text :description, :null=>false

      t.timestamps
    end
  end
end
