class CreateShippingLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_locations do |t|
      t.string :location
      t.integer :shipping_fee
      t.integer :reward_id

      t.timestamps
    end
    add_index :shipping_locations, :reward_id
  end
end
