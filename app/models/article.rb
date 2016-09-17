class Article < ApplicationRecord
  validates :title, presence: true,
            length: { minimum: 5 }
  validates :img_url, presence: true,
    format: { with: /\.(png|jpg)\Z/i }

  scope :ordered, -> { order('created_at DESC') }
end
