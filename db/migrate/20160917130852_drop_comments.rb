class DropComments < ActiveRecord::Migration[5.0]
  def change
    drop_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, foreign_key: true
      t.timestamps
    end
  end
end
