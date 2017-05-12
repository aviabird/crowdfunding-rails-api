class AddAuthorNameAndAuthorImageToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :author_name, :string
    add_column :comments, :author_image, :string
  end
end
