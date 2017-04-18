class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :url
      t.integer :project_id

      t.timestamps
    end

    add_index :links, :project_id
  end
end
