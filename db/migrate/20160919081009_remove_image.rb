class RemoveImage < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :image, :string
  end
end
