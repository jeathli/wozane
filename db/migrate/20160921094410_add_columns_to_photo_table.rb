class AddColumnsToPhotoTable < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :title, :string
    add_column :photos, :img_url, :string
  end
end
