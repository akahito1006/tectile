class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_article, only: [:show, :edit, :update]

  def index
    @last_article = Article.last
    @articles = Article
      .all
      .eager_load(:user, :likes, :comments, :article_images)
      .page(params[:page])
      .per(10)
      .reverse_order
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to admin_article_path(@article.id), notice: "編集を適用しました"
    else
      render "edit"
    end
  end

  def destroy
    if @article = Article.find(params[:id]).destroy
      redirect_to admin_articles_path, notice: "記事を削除しました"
    else
      redirect_to "/", notice: "エラーが発生しました"
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :user_id, article_images_images: [])
  end

  def set_article
    begin
      @article = Article.find(params[:id])
    rescue
      redirect_to "/", notice: "エラー：存在しない記事です。"
    end
  end
end
