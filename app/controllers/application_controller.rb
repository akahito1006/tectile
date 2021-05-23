class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def set_article(id)
    begin
      @article = Article.find(id)
    rescue
      redirect_to "/", notice: "エラー：存在しない記事です。"
    end
  end
  
  def set_user(id)
    begin
      @user = User.find(id)
    rescue
      redirect_to "/", notice: "エラーが発生しました"
    end
  end
end
