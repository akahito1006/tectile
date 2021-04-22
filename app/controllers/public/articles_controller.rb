class Public::ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @first_article = Article.first
    @articles = Article.all.offset(1).eager_load(:user, :likes, :comments, :article_images)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.likes_count = 0
    if @article.save
      redirect_to article_path(@article.id), notice: "新しい記事を投稿しました。"
    else
      render "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article.id), notice: "編集を適用しました"
    else
      render "edit"
    end
  end

  def destroy
    if @article = Article.find(params[:id]).destroy
      redirect_to articles_path, notice: "記事を削除しました"
    else
      redirect_to article_path(@article.id)
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id, article_images_images: [])
  end
end
