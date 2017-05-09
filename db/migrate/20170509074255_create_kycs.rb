class CreateKycs < ActiveRecord::Migration[5.0]
  def change
    create_table :kycs do |t|
      t.string :document_image_url
      t.string :document_id
      t.string :document_type
      t.string :name
      t.string :nationality
      t.datetime :birth_date
      t.integer :user_id

      t.timestamps
    end

    add_index :kycs, :user_id
  end
end
