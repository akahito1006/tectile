class Public::UsersController < ApplicationController
  
  def show
    @user = User.where(id: current_user.id).eager_load(:articles, :likes)
    @articles = Article.where(user_id: current_user.id).eager_load(:images)
    # a user has_many articles, an article has_many images. *a user has no images*
    # ---------------after edit
  end
  
  def unsubscribe
  end
  
end
