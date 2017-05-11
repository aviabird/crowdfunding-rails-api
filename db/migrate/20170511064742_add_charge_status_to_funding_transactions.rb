class AddChargeStatusToFundingTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :funding_transactions, :charge_status, :string
  end
end
