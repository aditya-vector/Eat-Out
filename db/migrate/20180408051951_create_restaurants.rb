class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :phone, limit: 8, null: false

      t.timestamps
    end
  end
end
