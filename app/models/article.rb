class Article < ApplicationRecord
  validates :title, presence: true,
            length: { minimum: 5 },
  validates :img_url, presence: true
end
