class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards, id: :uuid do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :amount
      t.string :project_id

      t.timestamps
    end
  end
end
