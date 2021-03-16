class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :guestname
      t.date :checkin
      t.date :checkout
      t.decimal :price
      t.timestamps
    end
  end
end
