class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :stock, index: true, foreign_key: true
      t.references :reservation_status, index: true, foreign_key: true, default: 4
      t.date :return_at

      t.timestamps null: false
    end
  end
end
