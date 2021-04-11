class Public::HomesController < ApplicationController
  def top
    @articles = Article.limit(3).eager_load(:user, :likes)
  end

  def about
  end
end
