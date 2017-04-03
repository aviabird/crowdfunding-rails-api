class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :overview
      t.string :image_url
      t.string :video_url
      t.string :goal
      t.string :model
      t.string :start_date
      t.string :duration
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
