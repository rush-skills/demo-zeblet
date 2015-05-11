class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :doctor, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :timing

      t.timestamps null: false
    end
  end
end
