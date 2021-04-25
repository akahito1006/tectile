class Public::LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    begin
      @article = Article.find(params[:article_id])
    rescue
      redirect_to "/", notice: "エラーが発生しました"
    end
    like = current_user.likes.new(article_id: @article.id)
    like.save
  end

  def destroy
    begin
      @article = Article.find(params[:article_id])
    rescue
      redirect_to "/", notice: "エラーが発生しました"
    end
    like = current_user.likes.find_by(article_id: @article.id)
    like.destroy
  end
end
