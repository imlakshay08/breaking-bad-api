class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end

    add_index :locations, :name
    add_index :locations, :city
  end
end
