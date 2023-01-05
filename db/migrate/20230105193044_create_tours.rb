class CreateTours < ActiveRecord::Migration[7.0]
  def change
    create_table :tours do |t|
      t.string :tourName
      t.string :picture
      t.text :description
      t.string :hotel
      t.float :price

      t.timestamps
    end
  end
end
