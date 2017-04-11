class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :heading
      t.text :description
      t.string :image_url
      t.integer :story_id

      t.timestamps
    end
  end
end
