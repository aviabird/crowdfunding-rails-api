class AddDeliveryDateAndQuantityToRewards < ActiveRecord::Migration[5.0]
  def change
    add_column :rewards, :delivery_date, :datetime
    add_column :rewards, :quantity, :integer
  end
end
