class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :work_shift, foreign_key: true, null: false
      t.time :arrival_at, null: false
      t.references :guest, foreign_key: true, null: false
      t.integer :guest_count, null: false
      t.references :seating_table, foreign_key: true, null: false

      t.timestamps
    end
  end
end
