class RemoveImageUrlFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :image_url
  end
end
