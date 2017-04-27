class AddSocialLinkColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :facebook_url, :string
    add_column :users, :twitter_url, :string
    add_column :users, :instagram_url, :string
    add_column :users, :google_plus_url, :string
  end
end
