class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    begin
      @user = User.where(id: params[:id]).eager_load(:articles, :likes)
    rescue
      redirect_to "/", notice: "エラー：存在しないユーザーです。"
    end
    @articles = Article
      .where(user_id: params[:id])
      .eager_load(:user, :likes, :comments, :article_images)
      .page(params[:page])
      .per(5)
      .reverse_order
    # a user has_many articles, an article has_many images. *a user has no images*
  end

  def edit
    set_user(params[:id])
  end

  def update
    set_user(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(params[:id]), notice: "会員情報を変更しました"
    else
      render "edit"
    end
  end

  def destroy
    if @user = User.find(params[:id]).destroy
      redirect_to root_path, notice: "退会しました"
    else
      redirect_to "/", notice: "エラーが発生しました"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
