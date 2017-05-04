class RemoveImageUrlFromRewards < ActiveRecord::Migration[5.0]
  def change
    remove_column :rewards, :image_url
  end
end
