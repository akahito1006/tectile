class ArticleImage < ApplicationRecord
  belongs_to :article
  attachment :image
  
  validates :article_id, presence: true
  validates :image_id  , presence: true
end
