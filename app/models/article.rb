class Article < ApplicationRecord
  
  belongs_to :user
  has_many :likes   , dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images  , dependent: :destroy
  accepts_nested_attributes_for :images
  accepts_attachments_for :images, attachment: :image
  
end
