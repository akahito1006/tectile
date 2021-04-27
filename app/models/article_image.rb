class ArticleImage < ApplicationRecord
  belongs_to :article
  attachment :image
  
# refile 複数投稿機能と干渉するため、バリデーションなしとする
end
