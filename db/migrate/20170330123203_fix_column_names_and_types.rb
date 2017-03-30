class FixColumnNamesAndTypes < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :overview, :category_id
    change_column :projects, :category_id, 'integer USING CAST(category_id AS integer)'
    rename_column :projects, :goal, :goal_amount
    change_column :projects, :goal_amount, 'integer USING CAST(goal_amount AS integer)'
    rename_column :projects, :model, :funding_model
    change_column :projects, :start_date, 'timestamp USING CAST(start_date AS timestamp)'
    change_column :projects, :duration, 'integer USING CAST(duration AS integer)'
  end
end
