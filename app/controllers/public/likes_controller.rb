class Public::LikesController < ApplicationController
  before_action :authenticate_user!, :set_article,  only: [:create, :destroy]

  def create
    like = current_user.likes.new(article_id: @article.id)
    like.save
  end

  def destroy
    like = current_user.likes.find_by(article_id: @article.id)
    like.destroy
  end
  
  private
  def set_article
    begin
      @article = Article.find(params[:article_id])
    rescue
      redirect_to "/", notice: "エラーが発生しました"
    end
  end
end
