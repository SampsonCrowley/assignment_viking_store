class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :abbr, :null=>false
      t.string :full, :null=>false

      t.timestamps
    end
  end
end
