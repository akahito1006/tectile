require "rails_helper"

RSpec.describe Like, "Likeモデルに関するテスト", type: :model do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:article)
  end
  
  describe "いいねの保存" do
    it "有効なデータを保存できるか？" do
      expect(FactoryBot.build(:like)).to be_valid
    end
    
    context "空白のバリデーションチェック" do
      it "いいねを付けたユーザー(user_id)が空の時、保存できない" do
        like = Like.new(user_id: "", article_id: "1")
        expect(like).to be_invalid
      end
      it "いいねされた記事(article_id)が空の時、保存できない" do
        like = Like.new(user_id: "1", article_id: "")
        expect(like).to be_invalid
      end
    end
  end
end