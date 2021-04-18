class Admin::SearchesController < ApplicationController
  def search
    @word_for_search = params[:word_for_search]
    @articles = Article.where("title LIKE ?", "%#{@word_for_search}%").eager_load(:user, :likes)
  end
end
