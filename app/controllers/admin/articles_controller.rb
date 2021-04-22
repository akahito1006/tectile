class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @first_article = Article.first
    @articles = Article.all.offset(1).eager_load(:user, :likes, :comments, :article_images)
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(params[:id])
  end

  def destroy
    @article = Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id, article_images_images: [])
  end
end
