class Article < ApplicationRecord
  validates :title, presence: true,
            length: { minimum: 5 }
  validates :img_url, presence: true

  scope :ordered, -> { order('created_at DESC') }
end
