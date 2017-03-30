class FixColumnNamesAndTypes < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :overview, :category_id
    change_column :projects, :category_id, :integer
    rename_column :projects, :goal, :goal_amount
    change_column :projects, :goal_amount, :integer
    rename_column :projects, :model, :funding_model
    change_column :projects, :start_date, :datetime
    change_column :projects, :duration, :integer
  end
end
