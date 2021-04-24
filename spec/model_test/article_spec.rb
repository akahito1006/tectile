require "rails_helper"

RSpec.describe Article, "Articleモデルに関するテスト", type: :model do
  before do
    FactoryBot.create(:user)
  end
  
  describe "記事データの保存" do
    it "有効なデータを保存できるか？" do
      expect(FactoryBot.build(:article)).to be_valid
    end
    
    context "空白のバリデーションチェック" do
      it "投稿ユーザー(user_id)が空の時、保存できない" do
        article = Article.new(user_id: "", title: Faker::Lorem.characters(number: 20), content: Faker::Lorem.characters(number: 300))
        expect(article).to be_invalid
      end
      it "タイトル(title)が空の時、保存できない" do
        article = Article.new(user_id: 1, title: "", content: Faker::Lorem.characters(number: 300))
        expect(article).to be_invalid
      end
      it "本文(content)が空の時、保存できない" do
        article = Article.new(user_id: 1, title: Faker::Lorem.characters(number: 20), content: "")
        expect(article).to be_invalid
      end
    end
  end
end