class CreateSeatBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :seat_bookings do |t|
      t.integer :seat_no
      t.references :movie_show, foreign_key: true

      t.timestamps
    end
  end
end
