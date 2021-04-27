class Admin::SearchesController < ApplicationController
  def search
    @word_for_search = params[:word_for_search]
    @range_option = params[:range_option]
    
    if @range_option == "記事検索"
      @articles = Article
        .where("title LIKE ?", "%#{@word_for_search}%")
        .eager_load(:user, :likes, :comments)
        .page(params[:page])
        .per(10)
        .reverse_order
    else
      @users = User
        .where("name LIKE ?", "%#{@word_for_search}%")
        .page(params[:page])
        .per(10)
    end
  end
end
