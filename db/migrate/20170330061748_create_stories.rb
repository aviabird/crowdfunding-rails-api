class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :heading
      t.text :description

      t.timestamps
    end
  end
end
