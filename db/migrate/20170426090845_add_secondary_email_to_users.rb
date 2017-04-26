class AddSecondaryEmailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :secondary_email, :string
  end
end
