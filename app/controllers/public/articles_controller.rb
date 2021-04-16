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
    @image = Image.new
    
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.likes_count = 0
    if @article.save
    p "---------------"
    p @article
    

    @image = Image.new(image_params)
    @Image.article_id = 1
    @Image.save
    end
    
    redirect_to articles_path
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def article_params
    params.require(:article).permit(:id, :title, :content, :user_id)
  end
  
  def image_params
    params.require(:image).permit(:id, :article_id, :image)
    # permit(:title, :content, post_images_images: []
  end

end
