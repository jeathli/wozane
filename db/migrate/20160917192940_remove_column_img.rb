class RemoveColumnImg < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :img_url_file_name , :string
    remove_column :articles, :img_url_content_type, :string
    remove_column :articles, :img_url_file_size, :integer
    remove_column :articles, :img_url_updated_at, :datetime
  end
end
