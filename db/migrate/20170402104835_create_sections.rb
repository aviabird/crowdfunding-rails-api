class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections, id: :uuid do |t|
      t.string :heading
      t.text :description
      t.string :image_url
      t.string :story_id

      t.timestamps
    end
  end
end
