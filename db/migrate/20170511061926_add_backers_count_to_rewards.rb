class AddBackersCountToRewards < ActiveRecord::Migration[5.0]
  def change
    add_column :rewards, :backers_count, :integer, default: 0
  end
end
