class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links, id: :uuid do |t|
      t.string :url
      t.string :project_id

      t.timestamps
    end
  end
end
