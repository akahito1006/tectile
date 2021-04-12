class Public::UsersController < ApplicationController
  
  def show
    @user = User.where(id: current_user.id).eager_load(:articles, :likes)
    
    @articles = Article.where(user_id: current_user.id).eager_load(:images)
    
    @liked = Like.where(article_id: @articles.first.id)
  end
  
  def unsubscribe
  end
  
end
