class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :aasm_state
      t.integer :category_id
      t.integer :user_id
      t.string :image_url
      t.string :video_url
      t.integer :pledged_amount
      t.integer :funded_amount, default: 0
      t.string :funding_model
      t.datetime :start_date
      t.integer :duration
      t.boolean :approved, default: false

      t.timestamps
    end

    add_index :projects, :category_id
    add_index :projects, :user_id
  end
end
