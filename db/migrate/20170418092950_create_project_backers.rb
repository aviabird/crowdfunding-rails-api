class CreateProjectBackers < ActiveRecord::Migration[5.0]
  def change
    create_table :project_backers do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end

    add_index :project_backers, :user_id
    add_index :project_backers, :project_id
  end
end
