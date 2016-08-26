class Article < ApplicationRecord
  has_attached_file :image,
                    :styles =>
                      { :medium => "300x300>",
                      :thumb => "100x100>"}

  validates :title, presence: true,
            length: { minimum: 5 }

  validates_attachment_content_type :image,
                                    :content_type =>
                                      /\Aimage\/.*\Z/
end
