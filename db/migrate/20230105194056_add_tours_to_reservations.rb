class AddToursToReservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :tours, null: false, foreign_key: true
  end
end
