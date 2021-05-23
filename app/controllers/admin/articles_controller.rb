class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!

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
    set_article(params[:id])
  end

  def edit
    set_article(params[:id])
  end

  def update
    set_article(params{:id})
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
