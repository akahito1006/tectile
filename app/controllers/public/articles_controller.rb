class Public::ArticlesController < ApplicationController
  
  def index
    @first_article = Article.first
    @articles = Article.all.offset(1).eager_load(:user, :likes, :comments)
  end
  
  def show
    @article = Article.find_by(id: params[:id])
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to article_path(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end
end
