class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.datetime :startDate
      t.datetime :endDate

      t.timestamps
    end
  end
end
