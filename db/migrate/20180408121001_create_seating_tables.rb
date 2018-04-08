class CreateSeatingTables < ActiveRecord::Migration[5.1]
  def change
    create_table :seating_tables do |t|
      t.string :name, null: false
      t.integer :min_seating, null: false
      t.integer :max_seating, null: false
      t.references :restaurant, foreign_key: true, null: false

      t.timestamps
    end
  end
end
