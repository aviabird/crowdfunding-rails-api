class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.text :reason
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
    add_index :reports, :project_id
  end
end
