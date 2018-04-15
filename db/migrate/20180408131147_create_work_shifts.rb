class CreateWorkShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :work_shifts do |t|
      t.references :restaurant
      t.time :starts_at, null: false
      t.time :ends_at, null: false

      t.timestamps
    end
  end
end
