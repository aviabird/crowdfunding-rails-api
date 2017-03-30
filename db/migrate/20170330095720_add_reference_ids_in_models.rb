class AddReferenceIdsInModels < ActiveRecord::Migration[5.0]
  def change
    add_column :rewards, :project_id, :integer
    add_column :stories, :project_id, :integer
    add_column :faqs, :project_id, :integer
    add_column :links, :project_id, :integer
    add_column :events, :project_id, :integer
  end
end
