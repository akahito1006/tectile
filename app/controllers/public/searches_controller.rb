class Public::SearchesController < ApplicationController
  def search
    @word_for_search = params[:word_for_search]
    @articles = Article
      .where("title LIKE ?", "%#{@word_for_search}%")
      .eager_load(:user, :likes, :comments)
      .page(params[:page])
      .per(10)
      .reverse_order
  end
end
