class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :url
      t.references :imageable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
