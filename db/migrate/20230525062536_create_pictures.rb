class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
