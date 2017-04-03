class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories, id: :uuid do |t|
      t.string :project_id
      
      t.timestamps
    end
  end
end
