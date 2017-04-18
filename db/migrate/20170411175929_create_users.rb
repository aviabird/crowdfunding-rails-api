class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image_url
      t.string :password_digest
      t.boolean :email_confirmed, :default => false
      t.string :confirm_token
      t.integer :role_id

      t.timestamps
    end

    add_index :users, :role_id
  end
end
