require "rails_helper"

RSpec.describe Comment, "Commentモデルに関するテスト", type: :model do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:article)
  end
  
  describe "コメントの保存" do
    it "有効なデータを保存できるか？" do
      expect(FactoryBot.build(:comment)).to be_valid
    end
    
    context "空白のバリデーションチェック" do
      it "コメント投稿ユーザー(user_id)が空の時、保存できない" do
        comment = Comment.new(user_id: "", article_id: "1", body: Faker::Lorem.characters(number: 20))
        expect(comment).to be_invalid
      end
      it "コメント記事(article_id)が空の時、保存できない" do
        comment = Comment.new(user_id: "1", article_id: "", body: Faker::Lorem.characters(number: 20))
        expect(comment).to be_invalid
      end
      it "コメント内容(body)が空の時、保存できない" do
        comment = Comment.new(user_id: "1", article_id: "1", body: "")
        expect(comment).to be_invalid
      end
    end
  end
end