class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @last_article = Article.last
    @articles = Article
      .all
      .eager_load(:user, :likes, :comments, :article_images)
      .page(params[:page])
      .per(5)
      .reverse_order
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    begin
      @article = Article.find(params[:id])
    rescue
      redirect_to "/", notice: "エラーが発生しました"
    end
  end

  def update
    begin
      @article = Article.find(params[:id])
    rescue
      redirect_to "/", notice: "エラーが発生しました"
    end
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
end
