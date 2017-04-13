class CreateSocialAuths < ActiveRecord::Migration[5.0]
  def change
    create_table :social_auths do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret

      t.timestamps
    end
    add_index :social_auths, :user_id
  end
end
