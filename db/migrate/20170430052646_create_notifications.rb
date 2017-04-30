class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :subject
      t.text :description
      t.boolean :read_status, default: false
      t.datetime :read_at
      t.integer :user_id

      t.timestamps
    end

    add_index :notifications, :user_id
  end
end
