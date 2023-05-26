class RenameImagesColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :images, :image
  end
end
