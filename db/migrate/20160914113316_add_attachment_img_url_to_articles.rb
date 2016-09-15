class AddAttachmentImgUrlToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.string :img_url
    end
  end

  def self.down
    remove_attachment :articles, :img_url
  end
end
