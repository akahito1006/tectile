class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    set_article(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.article_id = @article.id
    @comment.save
  end

  def destroy
    set_article(params[:article_id])
    comment = current_user.comments.find_by(article_id: @article.id)
    comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
