class AddBodyToStory < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :body, :text
  end
end
