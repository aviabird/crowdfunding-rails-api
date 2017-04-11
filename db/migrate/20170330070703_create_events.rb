class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :country
      t.date :date
      t.string :image_url
      t.text :description

      t.timestamps
    end
  end
end
