class CreateFutureDonors < ActiveRecord::Migration[5.0]
  def change
    create_table :future_donors do |t|

      t.string :customer_id
      t.integer :amount
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end

    add_index :future_donors, :project_id
  end
end
