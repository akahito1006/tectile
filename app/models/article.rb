class Article < ApplicationRecord
  
  belongs_to :user
  has_many :likes         , dependent: :destroy
  has_many :comments      , dependent: :destroy
  has_many :article_images, dependent: :destroy
  accepts_attachments_for :article_images, attachment: :image
  
end
