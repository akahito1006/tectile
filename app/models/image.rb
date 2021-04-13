class Image < ApplicationRecord
  
  belongs_to :article
  attachment :image
  
end
