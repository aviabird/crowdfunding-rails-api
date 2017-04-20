class CreateFundingTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :funding_transactions do |t|

      t.string :charge_id
      t.integer :amount
      t.string :currency
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end

    add_index :funding_transactions, :project_id
    add_index :funding_transactions, :user_id
  end
end
