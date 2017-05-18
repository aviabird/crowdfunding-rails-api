class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_stripe_connected, :boolean, default: false
    add_column :users, :stripe_user_id, :string
  end
end
