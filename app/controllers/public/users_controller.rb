class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    begin
      @user = User.where(id: current_user.id).eager_load(:articles, :likes)
    rescue
      redirect_to "/", notice: "エラーが発生しました"
    end
    @articles = Article
      .where(user_id: current_user.id)
      .eager_load(:user, :likes, :comments, :article_images)
      .page(params[:page])
      .per(5)
      .reverse_order
    # a user has_many articles, an article has_many images. *a user has no images*
  end

  def edit
    begin
      @user = User.find(params[:id])
    rescue
      redirect_to "/", notice: "エラーが発生しました"
    end
  end

  def update
    begin
      @user = User.find(params[:id])
    rescue
      redirect_to "/", notice: "エラーが発生しました"
    end
    if @user.update(user_params)
      redirect_to user_path(params[:id]), notice: "会員情報を変更しました"
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def destroy
    if @user = User.find(params[:id]).destroy
      redirect_to "/", notice: "退会しました"
    else
      redirect_to "/", notice: "エラーが発生しました"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
