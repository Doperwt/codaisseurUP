class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.decimal :price
      t.integer :group_size

      t.timestamps
    end
  end
end
