class AddStoryIdToSection < ActiveRecord::Migration[5.0]
  def change
    add_column :sections, :story_id, :integer
  end
end
