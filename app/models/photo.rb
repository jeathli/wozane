class Photo < ApplicationRecord
  validates :title, presence: true
  validates :img_url, presence: true

  scope :ordered, -> { order('created_at DESC') }
end
