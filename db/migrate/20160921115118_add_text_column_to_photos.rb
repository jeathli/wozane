class AddTextColumnToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :text, :text
  end
end
