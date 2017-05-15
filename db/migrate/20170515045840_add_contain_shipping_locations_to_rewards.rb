class AddContainShippingLocationsToRewards < ActiveRecord::Migration[5.0]
  def change
    add_column :rewards, :contain_shipping_locations, :boolean
  end
end
