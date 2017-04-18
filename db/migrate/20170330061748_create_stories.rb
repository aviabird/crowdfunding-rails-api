class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.integer :project_id
      
      t.timestamps
    end

    add_index :stories, :project_id
  end
end
