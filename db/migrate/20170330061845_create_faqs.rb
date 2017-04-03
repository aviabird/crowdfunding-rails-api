class CreateFaqs < ActiveRecord::Migration[5.0]
  def change
    create_table :faqs, id: :uuid do |t|
      t.text :question
      t.text :answer
      t.string :project_id

      t.timestamps
    end
  end
end
