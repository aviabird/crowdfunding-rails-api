class AddCurrencyToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :currency, :string
  end
end
