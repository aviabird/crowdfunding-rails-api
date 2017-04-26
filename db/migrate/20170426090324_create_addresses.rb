class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :city
      t.integer :postcode
      t.string :country
      t.integer :user_id

      t.timestamps
    end
  end
end
