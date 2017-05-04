class AddCurrencyToRewards < ActiveRecord::Migration[5.0]
  def change
    add_column :rewards, :currency, :string
  end
end
