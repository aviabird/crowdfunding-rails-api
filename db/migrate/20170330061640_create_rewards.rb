class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :amount
      t.integer :project_id

      t.timestamps
    end
  end
end
