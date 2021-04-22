class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).eager_load(:articles, :likes)
    @articles = Article.where(user_id: params[:id]).eager_load(:images)
    # a user has_many articles, an article has_many images. *a user has no images*
    # ---------------after edit
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_users_path
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
