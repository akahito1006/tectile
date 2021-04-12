class Public::UsersController < ApplicationController
  
  def show
    @user = User.where(id: current_user.id).eager_load(:articles, :likes)
    
    article = Article.where(user_id: current_user.id).first
    @liked = Like.where(article_id: article.id)
  end
  
  def unsubscribe
  end
end
