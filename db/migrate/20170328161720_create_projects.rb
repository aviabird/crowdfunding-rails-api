class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :category_id
      t.integer :user_id
      t.string :image_url
      t.string :video_url
      t.integer :goal_amount
      t.string :funding_model
      t.datetime :start_date
      t.integer :duration
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
