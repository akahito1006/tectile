class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.article_id = @article.id
    @comment.save
  end
  
  def destroy
    @article = Article.find(params[:id])
    comment = current_user.comments.find_by(article_id: @article.id)
    comment.destroy
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
