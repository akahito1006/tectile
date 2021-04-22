class Public::HomesController < ApplicationController
  def top
    @articles = Article.limit(3).eager_load(:user, :likes, :article_images)
  end

  def about
  end
end
