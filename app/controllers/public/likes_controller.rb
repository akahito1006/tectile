class Public::LikesController < ApplicationController
  before_action :authenticate_user!,  only: [:create, :destroy]

  def create
    set_article(params[:article_id])
    like = current_user.likes.new(article_id: @article.id)
    like.save
  end

  def destroy
    set_article(params[:article_id])
    like = current_user.likes.find_by(article_id: @article.id)
    like.destroy
  end
end
