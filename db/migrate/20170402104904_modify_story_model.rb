class ModifyStoryModel < ActiveRecord::Migration[5.0]
  def change
    remove_column :stories, :heading
    remove_column :stories, :description
  end
end
